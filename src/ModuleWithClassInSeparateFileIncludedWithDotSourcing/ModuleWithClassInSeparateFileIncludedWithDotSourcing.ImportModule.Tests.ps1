BeforeAll {
	Import-Module "$PSScriptRoot\ModuleWithClassInSeparateFileIncludedWithDotSourcing.psm1"
}

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
}