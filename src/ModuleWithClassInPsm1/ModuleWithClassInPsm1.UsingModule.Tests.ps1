using module .\ModuleWithClassInPsm1.psm1

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyClassInPsm1
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly' {
		$instance = [MyClassInPsm1]::new()
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type implicitly as a function parameter' {
		$implicitInstance = Get-MyClassInPsm1
		$instance = Get-MyClassInPsm1WithParameter -instance $implicitInstance
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly as a function parameter' {
		$explicitInstance = [MyClassInPsm1]::new()
		$instance = Get-MyClassInPsm1WithParameter -instance $explicitInstance
		$instance | Should -Not -Be $null
	}

	It 'Should return a new enum instance without error' {
		$enumValue = Get-MyEnumInPsm1
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum type explicitly' {
		$enumValue = [MyEnumInPsm1]::One
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the full enum type as a function parameter' {
		$enumValue = Get-MyEnumInPsm1WithParameter -enumValue ([MyEnumInPsm1]::One)
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum string value as a function parameter' {
		$enumValue = Get-MyEnumInPsm1WithParameter -enumValue One
		$enumValue | Should -Be 'One'
	}
}
