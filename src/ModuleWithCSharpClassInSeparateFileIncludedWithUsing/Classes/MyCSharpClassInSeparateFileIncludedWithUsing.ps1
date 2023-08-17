Add-Type -Language CSharp -TypeDefinition @"
	public enum MyCSharpEnumInSeparateFileIncludedWithUsing
	{
		One,
		Two
	}

	public class MyCSharpClassInSeparateFileIncludedWithUsing
	{
		public MyCSharpEnumInSeparateFileIncludedWithUsing EnumValue { get; set; }
	}
"@
