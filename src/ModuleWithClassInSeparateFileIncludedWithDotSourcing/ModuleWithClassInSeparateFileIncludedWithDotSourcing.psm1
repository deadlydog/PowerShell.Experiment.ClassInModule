. "$PSScriptRoot\Classes\MyClassInSeparateFileIncludedWithDotSourcing.ps1"

function Get-MyClassInSeparateFileIncludedWithDotSourcing
{
	return [MyClassInSeparateFileIncludedWithDotSourcing]::new()
}

Export-ModuleMember -Function Get-MyClassInSeparateFileIncludedWithDotSourcing
