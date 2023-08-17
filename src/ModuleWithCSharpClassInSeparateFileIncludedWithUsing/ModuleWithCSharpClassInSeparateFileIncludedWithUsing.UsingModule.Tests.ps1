using module .\ModuleWithCSharpClassInSeparateFileIncludedWithUsing.psm1

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyCSharpClassInSeparateFileIncludedWithUsing
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly' {
		$instance = [MyNamespace.MyCSharpClassInSeparateFileIncludedWithUsing]::new()
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type implicitly as a function parameter' {
		$implicitInstance = Get-MyCSharpClassInSeparateFileIncludedWithUsing
		$instance = Get-MyCSharpClassInSeparateFileIncludedWithUsingWithParameter -instance $implicitInstance
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly as a function parameter' {
		$explicitInstance = [MyNamespace.MyCSharpClassInSeparateFileIncludedWithUsing]::new()
		$instance = Get-MyCSharpClassInSeparateFileIncludedWithUsingWithParameter -instance $explicitInstance
		$instance | Should -Not -Be $null
	}

	It 'Should return a new enum instance without error' {
		$enumValue = Get-MyCSharpEnumInSeparateFileIncludedWithUsing
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum type explicitly' {
		$enumValue = [MyNamespace.MyCSharpEnumInSeparateFileIncludedWithUsing]::One
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the full enum type as a function parameter' {
		$enumValue = Get-MyCSharpEnumInSeparateFileIncludedWithUsingWithParameter -enumValue ([MyNamespace.MyCSharpEnumInSeparateFileIncludedWithUsing]::One)
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum string value as a function parameter' {
		$enumValue = Get-MyCSharpEnumInSeparateFileIncludedWithUsingWithParameter -enumValue One
		$enumValue | Should -Be 'One'
	}
}
