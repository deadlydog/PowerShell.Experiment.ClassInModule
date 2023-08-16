enum MyEnumInPsm1
{
	One
	Two
}

class MyClassInPsm1
{
	[MyEnumInPsm1] $EnumValue
}

function Get-MyClassInPsm1
{
	return [MyClassInPsm1]::new()
}

function Get-MyClassInPsm1WithParameter([MyClassInPsm1] $instance)
{
	return $instance
}

function Get-MyEnumInPsm1
{
	return [MyEnumInPsm1]::One
}

function Get-MyEnumInPsm1WithParameter([MyEnumInPsm1] $enumValue)
{
	return $enumValue
}

Export-ModuleMember -Function Get-MyClassInPsm1
Export-ModuleMember -Function Get-MyClassInPsm1WithParameter
Export-ModuleMember -Function Get-MyEnumInPsm1
Export-ModuleMember -Function Get-MyEnumInPsm1WithParameter
