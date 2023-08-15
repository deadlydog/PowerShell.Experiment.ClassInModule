using module .\ModuleWithClassInSeparateFileIncludedWithDotSourcing.psm1

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyClassInSeparateFileIncludedWithDotSourcing
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly' {
		$instance = [MyClassInSeparateFileIncludedWithDotSourcing]::new()
		$instance | Should -Not -Be $null
	}

	It 'Should return a new enum instance without error' {
		$enumValue = Get-MyEnumInSeparateFileIncludedWithDotSourcing
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum type explicitly' {
		$enumValue = [MyEnumInSeparateFileIncludedWithDotSourcing]::One
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the full enum type as a function parameter' {
		$enumValue = Get-MyEnumInSeparateFileIncludedWithDotSourcingWithParameter -enumValue ([MyEnumInSeparateFileIncludedWithDotSourcing]::One)
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum string value as a function parameter' {
		$enumValue = Get-MyEnumInSeparateFileIncludedWithDotSourcingWithParameter -enumValue One
		$enumValue | Should -Be 'One'
	}
}
