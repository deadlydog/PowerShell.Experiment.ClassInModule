. "$PSScriptRoot\Classes\MyClassInSeparateFileIncludedWithDotSourcing.ps1"

function Get-MyClassInSeparateFileIncludedWithDotSourcing
{
	return [MyClassInSeparateFileIncludedWithDotSourcing]::new()
}

function Get-MyEnumInSeparateFileIncludedWithDotSourcing([MyEnumInSeparateFileIncludedWithDotSourcing] $value)
{
	return [MyEnumInSeparateFileIncludedWithDotSourcing]::One
}

function Get-MyEnumInSeparateFileIncludedWithDotSourcingWithParameter([MyEnumInSeparateFileIncludedWithDotSourcing] $enumValue)
{
	return $enumValue
}

Export-ModuleMember -Function Get-MyClassInSeparateFileIncludedWithDotSourcing
Export-ModuleMember -Function Get-MyEnumInSeparateFileIncludedWithDotSourcing
Export-ModuleMember -Function Get-MyEnumInSeparateFileIncludedWithDotSourcingWithParameter
