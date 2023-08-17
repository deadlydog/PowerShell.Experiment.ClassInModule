Add-Type -Language CSharp -TypeDefinition @"
namespace MyNamespace {
	public enum MyCSharpEnumInSeparateFileIncludedWithUsing
	{
		One,
		Two
	}

	public class MyCSharpClassInSeparateFileIncludedWithUsing
	{
		public MyCSharpEnumInSeparateFileIncludedWithUsing EnumValue { get; set; }
	}
}
"@
