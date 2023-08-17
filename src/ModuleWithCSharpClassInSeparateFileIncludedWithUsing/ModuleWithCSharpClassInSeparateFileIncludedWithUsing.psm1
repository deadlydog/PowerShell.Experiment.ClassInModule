using module .\Classes\MyCSharpClassInSeparateFileIncludedWithUsing.ps1

function Get-MyCSharpClassInSeparateFileIncludedWithUsing
{
	return [MyNamespace.MyCSharpClassInSeparateFileIncludedWithUsing]::new()
}

function Get-MyCSharpClassInSeparateFileIncludedWithUsingWithParameter([MyNamespace.MyCSharpClassInSeparateFileIncludedWithUsing] $instance)
{
	return $instance
}

function Get-MyCSharpEnumInSeparateFileIncludedWithUsing
{
	return [MyNamespace.MyCSharpEnumInSeparateFileIncludedWithUsing]::One
}

function Get-MyCSharpEnumInSeparateFileIncludedWithUsingWithParameter([MyNamespace.MyCSharpEnumInSeparateFileIncludedWithUsing] $enumValue)
{
	return $enumValue
}

Export-ModuleMember -Function Get-MyCSharpClassInSeparateFileIncludedWithUsing
Export-ModuleMember -Function Get-MyCSharpClassInSeparateFileIncludedWithUsingWithParameter
Export-ModuleMember -Function Get-MyCSharpEnumInSeparateFileIncludedWithUsing
Export-ModuleMember -Function Get-MyCSharpEnumInSeparateFileIncludedWithUsingWithParameter
