using module ..\..\src\xml\GmailFilter.psm1

Describe 'Test Set-FromList' {
    BeforeAll {
        $ModuleHome = $script:PSCommandPath | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent

        $script:Data = [GmailFilter]::new()
        $script:Data.From = "*@teksystems.com OR *@koltersolutions.com OR *@hays.com"

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

    Context 'Setting From list' {
        It 'Should have sorted entries and set them as a list' {
            
            $Results = Set-FromList -Data $script:Data -Value "*@kavaliro", "*@tcs.com", "*@apexsystems.com"
            $Results.From | Should -Be '*@apexsystems.com OR *@kavaliro OR *@tcs.com'

            $Results = Set-FromList -Data $script:Data -Value "*@kavaliro", "*@kavaliro", "*@tcs.com", "*@apexsystems.com"
            $Results.From | Should -Be '*@apexsystems.com OR *@kavaliro OR *@tcs.com'
        }
    }
}

