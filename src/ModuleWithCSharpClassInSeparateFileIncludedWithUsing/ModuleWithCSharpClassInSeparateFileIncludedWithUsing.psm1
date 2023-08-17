using module .\Classes\MyCSharpClassInSeparateFileIncludedWithUsing.ps1

function Get-MyCSharpClassInSeparateFileIncludedWithUsing
{
	return [MyCSharpClassInSeparateFileIncludedWithUsing]::new()
}

function Get-MyCSharpClassInSeparateFileIncludedWithUsingWithParameter([MyCSharpClassInSeparateFileIncludedWithUsing] $instance)
{
	return $instance
}

function Get-MyCSharpEnumInSeparateFileIncludedWithUsing
{
	return [MyCSharpEnumInSeparateFileIncludedWithUsing]::One
}

function Get-MyCSharpEnumInSeparateFileIncludedWithUsingWithParameter([MyCSharpEnumInSeparateFileIncludedWithUsing] $enumValue)
{
	return $enumValue
}

Export-ModuleMember -Function Get-MyCSharpClassInSeparateFileIncludedWithUsing
Export-ModuleMember -Function Get-MyCSharpClassInSeparateFileIncludedWithUsingWithParameter
Export-ModuleMember -Function Get-MyCSharpEnumInSeparateFileIncludedWithUsing
Export-ModuleMember -Function Get-MyCSharpEnumInSeparateFileIncludedWithUsingWithParameter
