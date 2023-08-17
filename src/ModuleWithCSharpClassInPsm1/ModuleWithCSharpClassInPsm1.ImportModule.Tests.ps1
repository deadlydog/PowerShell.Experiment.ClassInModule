BeforeAll {
	Import-Module "$PSScriptRoot\ModuleWithCSharpClassInPsm1.psm1"
}

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyCSharpClassInPsm1
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly' {
		$instance = [MyCSharpClassInPsm1]::new()
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type implicitly as a function parameter' {
		$implicitInstance = Get-MyCSharpClassInPsm1
		$instance = Get-MyCSharpClassInPsm1WithParameter -instance $implicitInstance
		$instance | Should -Not -Be $null
	}

	It 'Should allow using the class type explicitly as a function parameter' {
		$explicitInstance = [MyCSharpClassInPsm1]::new()
		$instance = Get-MyCSharpClassInPsm1WithParameter -instance $explicitInstance
		$instance | Should -Not -Be $null
	}

	It 'Should return a new enum instance without error' {
		$enumValue = Get-MyCSharpEnumInPsm1
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum type explicitly' {
		$enumValue = [MyCSharpEnumInPsm1]::One
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the full enum type as a function parameter' {
		$enumValue = Get-MyCSharpEnumInPsm1WithParameter -enumValue ([MyCSharpEnumInPsm1]::One)
		$enumValue | Should -Be 'One'
	}

	It 'Should allow using the enum string value as a function parameter' {
		$enumValue = Get-MyCSharpEnumInPsm1WithParameter -enumValue One
		$enumValue | Should -Be 'One'
	}
}
