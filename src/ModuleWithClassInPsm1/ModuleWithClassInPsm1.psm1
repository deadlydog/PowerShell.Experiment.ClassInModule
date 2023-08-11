class MyClassInPsm1
{
	[string] $Name
}

function Get-MyClassInPsm1
{
	return [MyClassInPsm1]::new()
}

Export-ModuleMember -Function Get-MyClassInPsm1
