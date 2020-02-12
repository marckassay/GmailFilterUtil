using module ..\..\src\xml\GmailFilter.psm1

Describe 'Test Add-FromList' {
    BeforeAll {
        $ModuleHome = $script:PSCommandPath | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent

        $script:Data = [GmailFilter]::new()
        $script:Data.From = "*@teksystems.com OR *@koltersolutions.com OR *@hays.com"

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

    Context 'Adding to From list using parameter' {
        It 'Should have sorted entries and add them to existing list' {
            
            $Results = Add-FromList -Data $script:Data -Value "*@kavaliro", "*@tcs.com", "*@apexsystems.com"
            $Results.From | Should -Be '*@apexsystems.com OR *@hays.com OR *@kavaliro OR *@koltersolutions.com OR *@tcs.com OR *@teksystems.com'
        }
    }

    Context 'Adding to From list using pipeline' {
        It 'Should have sorted entries and add them to existing list' {
            
            $Results = $script:Data | Add-FromList -Value "*@kavaliro", "*@tcs.com", "*@apexsystems.com"
            $Results.From | Should -Be '*@apexsystems.com OR *@hays.com OR *@kavaliro OR *@koltersolutions.com OR *@tcs.com OR *@teksystems.com'

            # verify that name for varible is irrelivent
            $X = $script:Data
            $Results = $X | Add-FromList -Value "*@kavaliro", "*@tcs.com", "*@apexsystems.com"
            $Results.From | Should -Be '*@apexsystems.com OR *@hays.com OR *@kavaliro OR *@koltersolutions.com OR *@tcs.com OR *@teksystems.com'
        }
    }
}
