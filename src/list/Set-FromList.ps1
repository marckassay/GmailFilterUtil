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
            ValueFromPipeline = $false,
            ValueFromPipelineByPropertyName = $false,
            Position = 0
        )]
        [ValidateNotNull()]
        [GmailFilter]
        $Data,

        [Parameter(
            Mandatory = $true,
            ParameterSetName = "ByValue",
            ValueFromPipeline = $false,
            ValueFromPipelineByPropertyName = $false,
            Position = 1
        )]
        [ValidateNotNull()]
        [string[]]
        $Value
    )

    end {
        $Data.From = ''
        
        $SortedValue = $Value | Sort-Object | Select-Object -Unique
        $Data.From = $SortedValue | ForEach-Object -Begin { $script:Index = 0 } {
            if ($script:Index -eq 0) {
                "$_"
            }
            else {
                "OR $_"
            }
            $script:Index++
        } -End { Write-Verbose "The total number of entries for the From list is now '$script:Index'." }

        Write-Verbose ($Data.From)

        $Data
    }
}