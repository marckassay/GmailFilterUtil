---
external help file: GmailFilterUtil-help.xml
Module Name: GmailFilterUtil
online version: https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/docs/Add-FromList.md
schema: 2.0.0
---

# Add-FromList

## SYNOPSIS
Adds entries to a From list.

## SYNTAX

```
Add-FromList -GmailFilter <GmailFilter> [-Value] <String[]> [<CommonParameters>]
```

## DESCRIPTION

A Gmail filter has the ability to filter emails by the senders email address; who its *from*. This function can be used to add entries to a list.

## EXAMPLES

### Example 1

```powershell
PS C:\>
Import-XmlFilter -Path 'E:\temp\mailFilters.xml' | Add-FromList -Value "*@aerotek.com" | Export-XmlFilter -Path 'E:\temp\mailFilters.xml'
```

Imports Xml filter from a Gmail account, adds an entry with wildcard for recipient, and then exports data to same Xml file.

## PARAMETERS

### -Value

An entry to be add to the 'From' Gmail filter field.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GmailFilter
{{Fill GmailFilter Description}}

```yaml
Type: GmailFilter
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### GmailFilter

## OUTPUTS

### GmailFilter

## NOTES

## RELATED LINKS

[Add-FromList.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/src/list/Add-FromList.ps1)

[Add-FromList.Tests.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/test/list/Add-FromList.Tests.ps1)

[`Set-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/docs/Set-FromList.md)

[`Get-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/docs/Get-FromList.md)
