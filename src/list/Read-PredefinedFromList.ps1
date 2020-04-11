function Read-PredefinedFromList {
    [CmdletBinding(
        PositionalBinding = $true
    )]
    [OutputType([string[]])]
    Param(
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $false,
            Position = 0
        )]
        [ValidateSet("recruiters.us")]
        [string[]]
        $ListName,

        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $false,
            Position = 1
        )]
        [string]
        $BaseUri = 'https://raw.githubusercontent.com/marckassay/GmailFilterUtil/master/resources'
    )

    end {
        [string]$Content = Invoke-WebRequest -Uri "$BaseUri/$ListName.txt" | Select-Object -ExpandProperty Content

        # instead of setting $OFS, just replace it with a space. Also filter blankline entries.
        ($Content -replace '\r?\n', ' ').Replace('  ', ' ').Split(' ') | Where-Object { $_.Length -gt 0 }
    }
}
