using module .\Classes\MyClassInSeparateFile.ps1

function Get-MyClassInSeparateFile
{
	return [MyClassInSeparateFile]::new()
}

Export-ModuleMember -Function Get-MyClassInSeparateFile
