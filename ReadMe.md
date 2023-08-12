# PowerShell Experiment with a Class in a Module

This is a test repo to reproduce an issue I am having with Pester not finding the class type when it is defined in a separate file in the module, rather than directly in the psm1 file.

## The problem

If a class is created in the psm1 file of a module, then Pester can find it and use it in tests.
However, if the class is defined in a separate file in the module and included with a `using module` statement, then Pester cannot find it, failing with an error like:

> Unable to find type [MyClassInSeparateFile]

Even stranger, is that this issue does not happen on my local machine, but does happen on the build server with GitHub Actions.

## How to reproduce

This repo contains 2 modules, one with the class defined in the psm1 file, and one with the class defined in a separate file.
It defines a VS Code `test` task for running Pester locally, as well as a GitHub Actions workflow for running Pester on the build server.

When I run the `test` task locally from VS Code (e.g. run the `Tasks: Run Test Task` from the command palette), both modules pass all tests.
You could also simply run `Invoke-Pester` from the PowerShell terminal at the repo root directory to run the tests.

When Pester runs on the build server with GitHub Actions though, the MyClassInSeparateFile module fails with the error above.

[![build and test workflow](https://github.com/deadlydog/PowerShell.Experiment.ClassInModule/actions/workflows/build-and-test-powershell-module.yml/badge.svg)](https://github.com/deadlydog/PowerShell.Experiment.ClassInModule/actions/workflows/build-and-test-powershell-module.yml)
