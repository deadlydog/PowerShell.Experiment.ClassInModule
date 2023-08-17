Add-Type -Language CSharp -TypeDefinition @"
	public enum MyCSharpEnumInSeparateFileIncludedWithDotSourcing
	{
		One,
		Two
	}

	public class MyCSharpClassInSeparateFileIncludedWithDotSourcing
	{
		public MyCSharpEnumInSeparateFileIncludedWithDotSourcing EnumValue { get; set; }
	}
"@
