Add-Type -Language CSharp -TypeDefinition @"
	public enum MyCSharpEnumInPsm1
	{
		One,
		Two
	}

	public class MyCSharpClassInPsm1
	{
		public MyCSharpEnumInPsm1 EnumValue { get; set; }
	}
"@
