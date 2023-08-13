using module .\Classes\MyClassInSeparateFileIncludedWithUsing.ps1

function Get-MyClassInSeparateFileIncludedWithUsing
{
	return [MyClassInSeparateFileIncludedWithUsing]::new()
}

function Get-MyEnumInSeparateFileIncludedWithUsing
{
	return [MyEnumInSeparateFileIncludedWithUsing]::One
}

Export-ModuleMember -Function Get-MyClassInSeparateFileIncludedWithUsing
Export-ModuleMember -Function Get-MyEnumInSeparateFileIncludedWithUsing
