using module .\GmailFilter.psm1

function Export-XmlFilter {
    [CmdletBinding(
        DefaultParameterSetName = "ParameterSetName",
        PositionalBinding = $true
    )]
    [OutputType([System.Void], ParameterSetName = "ByPath")]
    Param(
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "ByPath",
            ValueFromPipeline = $true,
            Position = 0
        )]
        [ValidateNotNull()]
        [GmailFilter]
        $Data,

        [Parameter(
            Mandatory = $true,
            ParameterSetName = "ByPath",
            ValueFromPipeline = $false,
            Position = 1
        )]
        [ValidateNotNull()]
        [string[]]
        $Path
    )
    
    end {
        $XmlPath = Resolve-Path $Path

        [xml]$XmlContent = Get-Content -Path $XmlPath

        (Select-Xml -xml $XmlContent -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::FromXPath)).Node.Value = $Data.From
        (Select-Xml -xml $XmlContent -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::LabelXPath)).Node.Value = $Data.Label
        (Select-Xml -xml $XmlContent -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::ShouldTrashXPath)).Node.Value = $Data.ShouldTrash
        (Select-Xml -xml $XmlContent -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::ShouldNeverMarkAsImportantXPath)).Node.Value = $Data.ShouldNeverMarkAsImportant

        $XmlContent.Save($XmlPath.ProviderPath)
    }
}
