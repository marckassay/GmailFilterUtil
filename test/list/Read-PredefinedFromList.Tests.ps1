Describe 'Test Read-PredefinedFromList' {
    BeforeAll {
        $ModuleHome = $script:PSCommandPath | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent

        # Reimports 'GmailFilterUtil'. If its not currently import just silently continue
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

    Context 'Reading list' {
        It 'Should have downloaded a predefined list' {
            
            $Results = Read-PredefinedFromList -ListName 'recruiters.us'
            
            $Results | Should -Contain '*@apexsystems.com'
            $Results | Should -Contain '*@tcs.com'
            $Results | Should -Contain '*@teksystems.com'
        }
    }
}

