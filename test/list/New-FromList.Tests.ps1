Describe 'Test New-FromList' {
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

    Context 'Post executing New-Script' {
        It 'Should have command accessible' {
            $Results = Get-Command New-FromList | Select-Object -ExpandProperty CommandType
            $Results | Should -Be 'Function'
        }
    }
}

