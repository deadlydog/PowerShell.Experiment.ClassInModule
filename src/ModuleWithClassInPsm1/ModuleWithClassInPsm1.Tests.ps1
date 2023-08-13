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
}
