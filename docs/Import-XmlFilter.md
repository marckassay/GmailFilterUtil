---
external help file: GmailFilterUtil-help.xml
Module Name: GmailFilterUtil
online version: https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/docs/Import-XmlFilter.md
schema: 2.0.0
---

# Import-XmlFilter

## SYNOPSIS
Imports into PowerShell session, a Gmail exported filter.

## SYNTAX

```
Import-XmlFilter [-Path] <String[]> [<CommonParameters>]
```

## DESCRIPTION

Imports an Xml Gmail filter and parses that data into PowerShell datatype of `GmailFilter`.  Instructions from Google on how to import filters, see this [link](https://support.google.com/mail/answer/6579#)

## EXAMPLES

### Example 1

```powershell
PS C:\> $Feed = Import-XmlFilter -Path 'C:\Users\marc\Downloads\mailFilters.xml'
```

The default filename is `mailFilter` when exported out from Gmail. When downloaded, it can be found in the users download folder as this example shows.

## PARAMETERS

### -Path

Path to the exported Gmail filter. This must be a Xml file from Gmail.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

## OUTPUTS

### GmailFilter

## NOTES

## RELATED LINKS

[Import-XmlFilter.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/src/xml/Import-XmlFilter.ps1)

[Import-XmlFilter.Tests.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/test/xml/Import-XmlFilter.Tests.ps1)

[`Export-XmlFilter`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/docs/Export-XmlFilter.md)
