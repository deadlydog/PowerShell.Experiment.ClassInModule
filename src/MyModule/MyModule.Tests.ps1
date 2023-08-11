using module .\MyModule.psm1

Describe 'MyModule' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyClass
		$instance | Should -Not -Be $null
	}
}
