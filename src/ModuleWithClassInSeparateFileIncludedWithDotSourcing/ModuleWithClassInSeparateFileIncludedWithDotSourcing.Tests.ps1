using module .\ModuleWithClassInSeparateFileIncludedWithDotSourcing.psm1

Describe 'Module' {
	It 'Should return a new class instance without error' {
		$instance = Get-MyClassInSeparateFileIncludedWithDotSourcing
		$instance | Should -Not -Be $null
	}
}
