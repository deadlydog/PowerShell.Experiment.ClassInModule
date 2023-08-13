. "$PSScriptRoot\Classes\MyClassInSeparateFileIncludedWithDotSourcing.ps1"

function Get-MyClassInSeparateFileIncludedWithDotSourcing
{
	return [MyClassInSeparateFileIncludedWithDotSourcing]::new()
}

function Get-MyEnumInSeparateFileIncludedWithDotSourcing
{
	return [MyEnumInSeparateFileIncludedWithDotSourcing]::One
}

Export-ModuleMember -Function Get-MyClassInSeparateFileIncludedWithDotSourcing
Export-ModuleMember -Function Get-MyEnumInSeparateFileIncludedWithDotSourcing
