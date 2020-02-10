using module ..\..\src\xml\GmailFilter.psm1

Describe 'Test Export-XmlFilter' {

    BeforeAll {
        $ModuleHome = $script:PSCommandPath | Split-Path -Parent | Split-Path -Parent | Split-Path -Parent
        
        $TestXmlPath = "TestDrive:\"
        $script:TestXmlFullPath = Join-Path $TestXmlPath 'mailFilters.xml'
        Copy-Item -Path ..\mailFilters.xml -Destination $TestXmlPath
        
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

    Context 'Exporting Xml' {
        It 'Should have parsed GmailFilter data to Xml' {
            
            [xml]$Results = Get-Content -Path $script:TestXmlFullPath
            $LabelResult = (Select-Xml -xml $Results -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::LabelXPath)).Node.Value
            $LabelResult | Should -Be 'Headhunter'

            $Filter = [GmailFilter]::new()
            $Filter.From = '*@kforce.com'
            $Filter.Label = 'Recruiter'

            Export-XmlFilter -Path $script:TestXmlFullPath -Data $Filter
            
            [xml]$Results = Get-Content -Path $script:TestXmlFullPath
            $FromResult = (Select-Xml -xml $Results -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::FromXPath)).Node.Value
            $FromResult | Should -Be '*@kforce.com'

            $LabelResult = (Select-Xml -xml $Results -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::LabelXPath)).Node.Value
            $LabelResult | Should -Be 'Recruiter'
        }
    }
}

