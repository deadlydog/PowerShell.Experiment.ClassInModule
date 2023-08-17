Add-Type -Language CSharp -TypeDefinition @"
namespace MyNamespace {
	public enum MyCSharpEnumInSeparateFileIncludedWithDotSourcing
	{
		One,
		Two
	}

	public class MyCSharpClassInSeparateFileIncludedWithDotSourcing
	{
		public MyCSharpEnumInSeparateFileIncludedWithDotSourcing EnumValue { get; set; }
	}
}
"@
