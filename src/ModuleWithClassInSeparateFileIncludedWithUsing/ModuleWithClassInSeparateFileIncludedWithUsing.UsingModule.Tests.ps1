using module .\ModuleWithClassInSeparateFileIncludedWithUsing.psm1

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyClassInSeparateFileIncludedWithUsing
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly' {
		$instance = [MyClassInSeparateFileIncludedWithUsing]::new()
		$instance | Should -Not -Be $null
	}

	It 'Should return a new enum instance without error' {
		$enumValue = Get-MyEnumInSeparateFileIncludedWithUsing
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum type explicitly' {
		$enumValue = [MyEnumInSeparateFileIncludedWithUsing]::One
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the full enum type as a function parameter' {
		$enumValue = Get-MyEnumInSeparateFileIncludedWithUsingWithParameter -enumValue ([MyEnumInSeparateFileIncludedWithUsing]::One)
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum string value as a function parameter' {
		$enumValue = Get-MyEnumInSeparateFileIncludedWithUsingWithParameter -enumValue One
		$enumValue | Should -Be 'One'
	}
}
