using module ..\xml\GmailFilter.psm1

function Set-FromList {
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
        # since this is Set versus Add, overwrite the existing data. this behavior replicates PS's
        # Add-Content and Set-Content functions
        $GmailFilter.From = Format-FromListExpression -Value $Value
    }
}
