using module .\Classes\MyClass.ps1

function Get-MyClass
{
	return [MyClass]::new()
}

Export-ModuleMember -Function Get-MyClass
