using module ..\xml\GmailFilter.psm1

function Add-FromList {
    [CmdletBinding(
        DefaultParameterSetName = "ByValue",
        PositionalBinding = $true
    )]
    [OutputType([GmailFilter], ParameterSetName = "ByValue")]
    Param(
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "ByValue",
            ValueFromPipeline = $true,
            Position = 0
        )]
        [ValidateNotNull()]
        [GmailFilter]
        $GmailFilter,

        [Parameter(
            Mandatory = $true,
            ParameterSetName = "ByValue",
            ValueFromPipeline = $false,
            Position = 1
        )]
        [ValidateNotNull()]
        [string[]]
        $Value
    )

    end {

        if ($GmailFilter.From.length -gt 0) {
            $Value += $GmailFilter.From.Split(' OR ')
        }

        $GmailFilter.From = Format-FromListExpression -Value $Value
    }
}
