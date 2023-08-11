# PowerShell Experiment with a Class in a Module

This is a test repo to reproduce an issue I am having with Pester not finding the class when it is defined in a separate file in the module, rather than directly in the psm1 file.

## The problem

If a class is created in the psm1 file of a module, then Pester can find it and use it in tests.
However, if the class is defined in a separate file in the module, then Pester cannot find it, failing with an error like:

> Unable to find type [MyClass]

Even stranger, is that this issue does not happen on my local machine, but does happen on the build server with GitHub Actions.
