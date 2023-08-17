# PowerShell Experiment with a Class in a Module

This is a test repo to reproduce an issue I am having with Pester not finding the class type when it is defined in a separate file in the module, rather than directly in the psm1 file.

This repo implements several different approaches to using a class and an enum in a module to see what works and what doesn't.

## The problem

I would like to have each class defined in its own file, and then import the class file into the psm1 file of the module using `using module` or dot-sourcing.
Having each class in its own file helps keep the code organized and makes it easier to find the class you are looking for.

However, it seems that if the class is defined in a separate file in the module and included with a `using module` statement, then Pester cannot find it, failing with an error like:

> Unable to find type [MyClassInSeparateFile]

Even stranger, is that this issue does not happen on my local machine, but does happen on the build server with GitHub Actions.

## The experiment

This repo contains 6 modules:

1. One with a PowerShell class defined in a separate file and imported [via a `using module` statement](/src/ModuleWithClassInSeparateFileIncludedWithUsing/ModuleWithClassInSeparateFileIncludedWithUsing.psm1).
1. One with a PowerShell class defined in a separate file and imported [via dot-sourcing](/src/ModuleWithClassInSeparateFileIncludedWithDotSourcing/ModuleWithClassInSeparateFileIncludedWithDotSourcing.psm1).
1. One with a PowerShell class defined [in the psm1 file](/src/ModuleWithClassInPsm1/ModuleWithClassInPsm1.psm1).
1. One with a C# class defined in a separate file and imported [via a `using module` statement](/src/ModuleWithCSharpClassInSeparateFileIncludedWithUsing/ModuleWithCSharpClassInSeparateFileIncludedWithUsing.psm1).
1. One with a C# class defined in a separate file and imported [via dot-sourcing](/src/ModuleWithCSharpClassInSeparateFileIncludedWithDotSourcing/ModuleWithCSharpClassInSeparateFileIncludedWithDotSourcing.psm1).
1. One with a C# class defined [in the psm1 file](/src/ModuleWithCSharpClassInPsm1/ModuleWithCSharpClassInPsm1.psm1).

Each module contains Pester tests to test:

- The class can be used by the module functions.
- The class type can be used outside of the module.

Each Pester test file is duplicated so it can reference the module in 2 ways:

- Using `using module` to import the module.
- Using `Import-Module` to import the module.

In addition to defining classes in various ways and testing them, I also define and tests enums in the same ways to see if they suffer from the same issues.

## Reproducing the issue (e.g. running the experiment)

This repo defines a VS Code `test` task for running Pester locally, as well as a GitHub Actions workflow for running Pester on the build server.

When I run the `test` task locally from VS Code (e.g. run the `Tasks: Run Test Task` from the command palette), both the `ModuleWithClassInPsm1` and `ModuleWithClassInSeparateFileIncludedWithUsing` modules pass all tests.
You could also simply run `Invoke-Pester` from the PowerShell terminal at the repo root directory to run the tests.

When Pester runs on the build server with GitHub Actions though, the `ModuleWithClassInSeparateFileIncludedWithUsing` module fails with the error above.
See [the failing GitHub Action workflow](https://github.com/deadlydog/PowerShell.Experiment.ClassInModule/actions/workflows/build-and-test-powershell-module.yml) for the error message details.

[![build and test workflow](https://github.com/deadlydog/PowerShell.Experiment.ClassInModule/actions/workflows/build-and-test-powershell-module.yml/badge.svg)](https://github.com/deadlydog/PowerShell.Experiment.ClassInModule/actions/workflows/build-and-test-powershell-module.yml)

To try and remove my local machine from the equation, I created a Dev Container that can be used to run the VS Code `test` task locally from a Docker container.
Initially using the Dev Container produced the same results as the GitHub Action.
However,the next day it was producing the same results as when running on my local machine.
My local machine must somehow be caching the types, even across new and separate PowerShell sessions.
It is weird that the Dev Container also produces mixed results.

## Experiment results

To ensure my local machine is not impacting the results, all results shown below are from running the tests in GitHub Actions.

### Referencing the PowerShell class/enum in the module

The results of using the different methods to reference a PowerShell native class/enum in the script module are as follows:

|                                              | Class/Enum can be used by module functions | Class/Enum type can be used outside of module |
| -------------------------------------------- | ------------------------------------------ | --------------------------------------------- |
| Class/Enum file imported with `using module` | ❌                                          | ❌                                             |
| Class/Enum file imported with Dot-sourcing   | ✔️                                          | ❌                                             |
| Class/Enum defined in the psm1 file          | ✔️                                          | ✔️                                             |

If I use `using module` to import the file with the class, then the class cannot be used by the module functions, and the class type cannot be used outside of the module.
Simply put, it does not work at all.

If I dot-source the file with the class, then the class can be used by the module functions, but the class type still cannot be used outside of the module.
Anytime the class name is referenced you get the `Unable to find type` error.

If I define the class in the psm1 file, then the class can be used by the module functions (both as output and input parameters), and the class type can be used outside of the module.

Enums behaved the same as classes in all of the tests that were performed.

### Referencing the module

I also tested the 2 different ways a module can be imported; with `Import-Module` and `using module`.
An important distinction between the two is that `Import-Module` is a cmdlet that is versioned and can be updated in newer PowerShell versions, while `using module` is a language keyword, like `if` or `foreach`.
The two are fundamentally different, and behave differently when importing modules.

The results below assume the class/enum is referenced directly in the psm1 file for script modules, as that is the recommended approach to take after seeing the results from the previous section.

|                                      | Class/Enum can be used by module functions | Class/Enum type can be used outside of module |
| ------------------------------------ | ------------------------------------------ | --------------------------------------------- |
| Module imported with `Import-Module` | ✔️                                          | ❌                                             |
| Module imported with `using module`  | ✔️                                          | ✔️                                             |

If you use `Import-Module` to import the module, you can use the class/enum values implicitly, and autocomplete will work.
By implicitly, I mean that you can retrieve a class/enum instance from a module function, pass the instance around, modify the class properties, and pass it back into module function parameters.

You cannot use the class/enum type explicitly outside of the module though.
That is, you cannot create a new instance of the class, or reference the enum values directly, such as performing a `switch` statement on them.
As soon as you need to reference the class/enum name in your script (e.g. `[MyClass]` or `[MyEnum]`), you will get the `Unable to find type` error.

The only way to be able to reference the class/enum name outside of the module is to import the module with `using module`.
I did not explicitly test this using a binary module, but I expect the results would be the same.

### Referencing a C# class/enum in the module

Rather than using the PowerShell native classes and enums, we can define C# classes and enums inline in PowerShell as a string.
This even works in pre-PowerShell 5 versions.
It is a bit ugly, as you lose syntax highlighting and editor intellisense and checks, and you need to write the code as C# instead of PowerShell, but it does work.

Here is what the equivalent definition of the example PowerShell native class and enum shown earlier would look like when defining them as a C# class and enum in your PowerShell script or module:

```csharp
Add-Type -Language CSharp -TypeDefinition @"
  public class MyClass {
      public string Name { get; set; }
      public int Age { get; set; }
  }

  public enum MyEnum {
      Value1
      Value2
  }
"@
```

We could optionally put our class and enum in a namespace as well (e.g. `MyNamespace`), and then reference their types in PowerShell like `[MyNamespace.MyClass]` and `[MyNamespace.MyEnum]`.
Using namespaces can help avoid naming conflicts for common class names.

Using C# classes and enums as shown above instead of the PowerShell native class/enum, the results are as follows:

|                                              | C# Class/Enum can be used by module functions | C# Class/Enum type can be used outside of module |
| -------------------------------------------- | --------------------------------------------- | ------------------------------------------------ |
| Class/Enum file imported with `using module` | ✔️                                             | ✔️                                                |
| Class/Enum file imported with Dot-sourcing   | ✔️                                             | ✔️                                                |
| Class/Enum defined in the psm1 file          | ✔️                                             | ✔️                                                |

|                                      | C# Class/Enum can be used by module functions | C# Class/Enum type can be used outside of module |
| ------------------------------------ | --------------------------------------------- | ------------------------------------------------ |
| Module imported with `Import-Module` | ✔️                                             | ✔️                                                |
| Module imported with `using module`  | ✔️                                             | ✔️                                                |

You can see that using C# classes/enums is much more flexible than using the PowerShell native classes/enums.
They allow us to define the classes/enums in their own files, and allow end-users to use `Import-Module` and still have full access to the class/enum types.
The downsides are that they are a bit ugly as inline strings, and you need to know the C# syntax instead of PowerShell syntax.

## Conclusion

If using PowerShell native classes/enums, the best approach, as of PowerShell version 7.3.6, is to define the class/enum directly in the psm1 file of the module.
Also, modules should be imported with `using module` if you want to be able to use the class/enum types outside of the module.

If you really want to have your PowerShell native classes/enums in separate files, and you don't intend for the class/enum types to be used outside of the module, then you can use dot-sourcing to import the class file and use `Import-Module` to import the module.

If you don't want to have to remember the limitations and how to work around them, then use C# classes/enums instead of PowerShell ones.

Hopefully a future version of PowerShell will allow us to dot-source import classes/enums from other files and still be able to use their types both within and outside the module, and make the native PowerShell class/enum experience better.
