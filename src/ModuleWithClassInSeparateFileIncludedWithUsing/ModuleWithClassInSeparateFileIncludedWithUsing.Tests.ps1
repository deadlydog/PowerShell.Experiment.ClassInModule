using module .\ModuleWithClassInSeparateFileIncludedWithUsing.psm1

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyClassInSeparateFileIncludedWithUsing
		$instance | Should -Not -Be $null
	}
}
