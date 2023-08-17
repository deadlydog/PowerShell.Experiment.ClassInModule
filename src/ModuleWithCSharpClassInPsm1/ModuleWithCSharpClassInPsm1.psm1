Add-Type -Language CSharp -TypeDefinition @"
namespace MyNamespace {
	public enum MyCSharpEnumInPsm1
	{
		One,
		Two
	}

	public class MyCSharpClassInPsm1
	{
		public MyCSharpEnumInPsm1 EnumValue { get; set; }
	}
}
"@

function Get-MyCSharpClassInPsm1
{
	return [MyNamespace.MyCSharpClassInPsm1]::new()
}

function Get-MyCSharpClassInPsm1WithParameter([MyNamespace.MyCSharpClassInPsm1] $instance)
{
	return $instance
}

function Get-MyCSharpEnumInPsm1
{
	return [MyNamespace.MyCSharpEnumInPsm1]::One
}

function Get-MyCSharpEnumInPsm1WithParameter([MyNamespace.MyCSharpEnumInPsm1] $enumValue)
{
	return $enumValue
}

Export-ModuleMember -Function Get-MyCSharpClassInPsm1
Export-ModuleMember -Function Get-MyCSharpClassInPsm1WithParameter
Export-ModuleMember -Function Get-MyCSharpEnumInPsm1
Export-ModuleMember -Function Get-MyCSharpEnumInPsm1WithParameter
