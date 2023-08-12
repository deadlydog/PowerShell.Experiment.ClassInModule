using module .\ModuleWithClassInSeparateFileIncludedWithUsing.psm1

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyClassInSeparateFile
		$instance | Should -Not -Be $null
	}
}
