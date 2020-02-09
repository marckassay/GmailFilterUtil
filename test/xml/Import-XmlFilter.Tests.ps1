Describe 'Test Import-XmlFilter' {
    BeforeAll {
        $ModuleHome = $script:PSCommandPath | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent

        # Reimports 'GmailFilterUtil'.  If its not currently import just silently continue
        Remove-Module -Name 'GmailFilterUtil' -ErrorAction SilentlyContinue
        Import-Module $ModuleHome

        InModuleScope 'GmailFilterUtil' {
            $script:SUT = $true
        }
    }
    
    AfterAll {
        InModuleScope 'GmailFilterUtil' {
            $script:SUT = $false
        }
    }

    Context 'Importing Xml' {
        It 'Should have parsed Xml data to GmailFilter data' {
            $Results = Import-XmlFilter -Path ..\mailFilters.xml
            $Results.From | Should -Be "*@teksystems.com OR *@koltersolutions.com OR *@hays.com"
            $Results.Label | Should -Be "Headhunter"
            $Results.ShouldTrash | Should -Be $true
            $Results.ShouldNeverMarkAsImportant | Should -Be $true
        }
    }
}
