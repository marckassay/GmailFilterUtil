using module .\GmailFilter.psm1

function Import-XmlFilter {
    [CmdletBinding(
        DefaultParameterSetName = "ParameterSetName",
        PositionalBinding = $true
    )]
    [OutputType([GmailFilter], ParameterSetName = "ParameterSetName")]
    Param(
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "ParameterSetName",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0
        )]
        [ValidateNotNull()]
        [string[]]
        $Path
    )
    
    end {
        $Filter = [GmailFilter]::new()

        $XmlPath = Resolve-Path $Path

        $Filter.From = Select-Xml -Path $XmlPath -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::FromXPath) | `
            Select-Object -ExpandProperty Node | `
            Select-Object -ExpandProperty Value
         
        $Filter.Label = Select-Xml -Path $XmlPath -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::LabelXPath) | `
            Select-Object -ExpandProperty Node | `
            Select-Object -ExpandProperty Value

        $Filter.ShouldTrash = $(Select-Xml -Path $XmlPath -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::ShouldTrashXPath) | `
                Select-Object -ExpandProperty Node | `
                Select-Object -ExpandProperty Value) -eq 'true'
                
        $Filter.ShouldNeverMarkAsImportant = (Select-Xml -Path $XmlPath -Namespace ([GmailFilter]::AppsNameSpace) -XPath ([GmailFilter]::ShouldNeverMarkAsImportantXPath) | `
                Select-Object -ExpandProperty Node | `
                Select-Object -ExpandProperty Value) -eq 'true'

        $Filter
    }
}