enum MyEnumInPsm1
{
	One
}

class MyClassInPsm1
{
	[MyEnumInPsm1] $EnumValue
}

function Get-MyClassInPsm1
{
	return [MyClassInPsm1]::new()
}

function Get-MyEnumInPsm1
{
	return [MyEnumInPsm1]::One
}

Export-ModuleMember -Function Get-MyClassInPsm1
Export-ModuleMember -Function Get-MyEnumInPsm1
