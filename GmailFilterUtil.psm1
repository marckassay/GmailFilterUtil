using module .\src\list\New-FromList.ps1
using module .\src\xml\Export-XmlFilter.ps1
using module .\src\xml\Import-XmlFilter.ps1
using module .\src\xml\New-XmlFilter.ps1

Param(
    [Parameter(Mandatory = $False)]
    [bool]$SUT = $False
)

$script:SUT = $SUT
if ($script:SUT -eq $False) {
    # Start-Module
}

