BeforeAll {
	Import-Module "$PSScriptRoot\ModuleWithClassInPsm1.psm1"
}

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyClassInPsm1
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly' {
		$instance = [MyClassInPsm1]::new()
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
}
