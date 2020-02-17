---
external help file: GmailFilterUtil-help.xml
Module Name: GmailFilterUtil
online version: https://github.com/marckassay/GmailFilterUtil/blob/0.0.3/docs/Set-FromList.md
schema: 2.0.0
---

# Set-FromList

## SYNOPSIS
Sets entries to a From list.

## SYNTAX

```
Set-FromList [-Data] <GmailFilter> [-Value] <String[]> [<CommonParameters>]
```

## DESCRIPTION

A Gmail filter has the ability to filter emails by the senders email address; who its *from*. This function can be used to set entries to a list. This functions clears the exisiting list. To add entries, use `Add-FromList` function

## EXAMPLES

### Example 1

```powershell
PS C:\> Import-XmlFilter -Path 'E:\temp\mailFilters.xml' | Set-FromList -Value "*@aerotek.com" | Export-XmlFilter -Path 'E:\temp\mailFilters.xml'
```

Imports Xml filter from a Gmail account, sets an entry with wildcard for recipient, and then exports data to same Xml file.

## PARAMETERS

### -Data

{{Fill Data Description}}

```yaml
Type: GmailFilter
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Value

{{Fill Value Description}}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### GmailFilter

## OUTPUTS

### GmailFilter

## NOTES

## RELATED LINKS

[Set-FromList.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.3/src/list/Set-FromList.ps1)

[Set-FromList.Tests.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.3/test/list/Set-FromList.Tests.ps1)

[`Get-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.3/docs/Get-FromList.md)

[`Add-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.3/docs/Add-FromList.md)
