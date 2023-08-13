# PowerShell Experiment with a Class in a Module

This is a test repo to reproduce an issue I am having with Pester not finding the class type when it is defined in a separate file in the module, rather than directly in the psm1 file.

This repo implements several different approaches to using a class in a module to see what works and what doesn't.

## The problem

I would like to have each class defined in its own file, and then import the class file into the psm1 file of the module using `using module` or dot-sourcing.
Having each class in its own file helps keep the code organized and makes it easier to find the class you are looking for.

However, it seems that if the class is defined in a separate file in the module and included with a `using module` statement, then Pester cannot find it, failing with an error like:

> Unable to find type [MyClassInSeparateFile]

Even stranger, is that this issue does not happen on my local machine, but does happen on the build server with GitHub Actions.

## How to reproduce

This repo contains 3 modules:

1. One with the class defined in the psm1 file.
1. One with the class defined in a separate file and imported via a `using module` statement.
1. One with the class defined in a separate file and imported via dot-sourcing.

This repo defines a VS Code `test` task for running Pester locally, as well as a GitHub Actions workflow for running Pester on the build server.

When I run the `test` task locally from VS Code (e.g. run the `Tasks: Run Test Task` from the command palette), the local psm1 and `using module` modules pass all tests.
You could also simply run `Invoke-Pester` from the PowerShell terminal at the repo root directory to run the tests.

When Pester runs on the build server with GitHub Actions though, the `using module` module fails with the error above.

[![build and test workflow](https://github.com/deadlydog/PowerShell.Experiment.ClassInModule/actions/workflows/build-and-test-powershell-module.yml/badge.svg)](https://github.com/deadlydog/PowerShell.Experiment.ClassInModule/actions/workflows/build-and-test-powershell-module.yml)

## Experiment results

The results of the experiment are as follows:

|                                    | Class can be used by module functions | Class type can be used outside of module |
| ---------------------------------- | ------------------------------------- | ---------------------------------------- |
| Class imported with `using module` | ❌                                     | ❌                                     |
| Class imported with Dot-sourcing   | ✔️                                     | ❌                                     |
| Class defined in psm1              | ✔️                                     | ✔️                                     |

If we use `using module` to import the file with the class, then the class cannot be used by the module functions, and the class type cannot be used outside of the module.

If we dot-source the file with the class, then the class can be used by the module functions, but the class type still cannot be used outside of the module.

If we define the class in the psm1 file, then the class can be used by the module functions, and the class type can be used outside of the module.

## Conclusion

The best approach, as of PowerShell version 7.1.3, is to define the class in the psm1 file of the module.

If you really want to have your classes in separate files, and you don't intend for the class types to be used outside of the module, then you can use dot-sourcing to import the class file.

Hopefully future versions of PowerShell will allow us to use either `using module` or dot-sourcing to import the class file, and still be able to use the class in the module functions, and the class type outside of the module.

I did not discover why the `using module` approach works locally, but not on the build server.
I assume something must be cached somehow, even between PowerShell sessions.
I am going to assume this is an anomaly with my machine though and trust the GitHub Action results above my local machine results.
