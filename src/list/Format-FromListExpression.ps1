function Format-FromListExpression {
    [CmdletBinding(
        DefaultParameterSetName = "ByValue",
        PositionalBinding = $true
    )]
    [OutputType([string[]], ParameterSetName = "ByValue")]
    Param(
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "ByValue",
            ValueFromPipeline = $false,
            Position = 0
        )]
        [ValidateNotNull()]
        [string[]]
        $Value
    )

    end {
        
        $SortedValue = $Value | Sort-Object | Select-Object -Unique
        $FromListExpression = $SortedValue | ForEach-Object -Begin { $script:Index = 0 } {
            if ($script:Index -eq 0) {
                "$_"
            }
            else {
                "OR $_"
            }
            $script:Index++
        } -End { Write-Verbose "The total number of entries for the From list is now '$script:Index'." }

        $FromListExpression
    }
}
