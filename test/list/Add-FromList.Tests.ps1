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

    Context 'Adding From list' {
        It 'Should have sorted entries and add them to existing list' {
            
            $Results = Add-FromList -Data $script:Data -Value "*@kavaliro", "*@tcs.com", "*@apexsystems.com"
            Write-Host $Results.From
            Write-Host '*@apexsystems.com OR *@hays.com" OR *@kavaliro OR *@koltersolutions.com OR *@tcs.com OR *@teksystems.com'
            $Results.From | Should -Be '*@apexsystems.com OR *@hays.com OR *@kavaliro OR *@koltersolutions.com OR *@tcs.com OR *@teksystems.com'
        }
    }
}
