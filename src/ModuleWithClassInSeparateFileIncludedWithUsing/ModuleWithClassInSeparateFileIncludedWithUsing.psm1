using module .\Classes\MyClassInSeparateFileIncludedWithUsing.ps1

function Get-MyClassInSeparateFileIncludedWithUsing
{
	return [MyClassInSeparateFileIncludedWithUsing]::new()
}

function Get-MyClassInSeparateFileIncludedWithUsingWithParameter([MyClassInSeparateFileIncludedWithUsing] $instance)
{
	return $instance
}

function Get-MyEnumInSeparateFileIncludedWithUsing
{
	return [MyEnumInSeparateFileIncludedWithUsing]::One
}

function Get-MyEnumInSeparateFileIncludedWithUsingWithParameter([MyEnumInSeparateFileIncludedWithUsing] $enumValue)
{
	return $enumValue
}

Export-ModuleMember -Function Get-MyClassInSeparateFileIncludedWithUsing
Export-ModuleMember -Function Get-MyClassInSeparateFileIncludedWithUsingWithParameter
Export-ModuleMember -Function Get-MyEnumInSeparateFileIncludedWithUsing
Export-ModuleMember -Function Get-MyEnumInSeparateFileIncludedWithUsingWithParameter
