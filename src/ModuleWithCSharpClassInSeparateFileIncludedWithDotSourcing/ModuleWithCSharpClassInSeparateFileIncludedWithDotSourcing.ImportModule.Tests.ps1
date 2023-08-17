BeforeAll {
	Import-Module "$PSScriptRoot\ModuleWithCSharpClassInSeparateFileIncludedWithDotSourcing.psm1"
}

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyCSharpClassInSeparateFileIncludedWithDotSourcing
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly' {
		$instance = [MyCSharpClassInSeparateFileIncludedWithDotSourcing]::new()
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type implicitly as a function parameter' {
		$implicitInstance = Get-MyCSharpClassInSeparateFileIncludedWithDotSourcing
		$instance = Get-MyCSharpClassInSeparateFileIncludedWithDotSourcingWithParameter -instance $implicitInstance
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly as a function parameter' {
		$explicitInstance = [MyCSharpClassInSeparateFileIncludedWithDotSourcing]::new()
		$instance = Get-MyCSharpClassInSeparateFileIncludedWithDotSourcingWithParameter -instance $explicitInstance
		$instance | Should -Not -Be $null
	}

	It 'Should return a new enum instance without error' {
		$enumValue = Get-MyCSharpEnumInSeparateFileIncludedWithDotSourcing
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum type explicitly' {
		$enumValue = [MyCSharpEnumInSeparateFileIncludedWithDotSourcing]::One
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the full enum type as a function parameter' {
		$enumValue = Get-MyCSharpEnumInSeparateFileIncludedWithDotSourcingWithParameter -enumValue ([MyCSharpEnumInSeparateFileIncludedWithDotSourcing]::One)
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum string value as a function parameter' {
		$enumValue = Get-MyCSharpEnumInSeparateFileIncludedWithDotSourcingWithParameter -enumValue One
		$enumValue | Should -Be 'One'
	}
}
