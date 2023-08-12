using module .\Classes\MyClassInSeparateFileIncludedWithUsing.ps1

function Get-MyClassInSeparateFileIncludedWithUsing
{
	return [MyClassInSeparateFileIncludedWithUsing]::new()
}

Export-ModuleMember -Function Get-MyClassInSeparateFileIncludedWithUsing
