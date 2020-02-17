---
external help file: GmailFilterUtil-help.xml
Module Name: GmailFilterUtil
online version: https://github.com/marckassay/GmailFilterUtil/blob/0.0.3/docs/Export-XmlFilter.md
schema: 2.0.0
---

# Export-XmlFilter

## SYNOPSIS
Exports PowerShell data back to Gmail exported filter.

## SYNTAX

### ParameterSetName (Default)
```
Export-XmlFilter [<CommonParameters>]
```

### ByPath
```
Export-XmlFilter [-Data] <GmailFilter> [-Path] <String[]> [<CommonParameters>]
```

## DESCRIPTION

Exports `GmailFilter` data back into a Xml Gmail filter. Instructions from Google on how to export filters, see this [link](https://support.google.com/mail/answer/6579#).

## EXAMPLES

### Example 1

```powershell
PS C:\>
$NewList = Get-FromList -ListName 'recruiters.us'
$NewList += '*@globochem.com'
Export-XmlFilter -Data $NewList -Path 'E:\temp\mailFilters.xml'
```

Downloads predefined enteries using `Get-FromList`, adds an additional entry, and exports data to 'mailFilters.xml' file. Afterwards, using Gmail you can upload this Xml file into your filters of Gmail.

## PARAMETERS

### -Data

The GmailFilter datatype that is returned from `Import-XmlFilter`, `Add-FromList` and `Set-FromList`.

```yaml
Type: GmailFilter
Parameter Sets: ByPath
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path

Path to the Xml file.

```yaml
Type: String[]
Parameter Sets: ByPath
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

### System.Void

## NOTES

## RELATED LINKS

[Export-XmlFilter.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.3/src/xml/Export-XmlFilter.ps1)

[Export-XmlFilter.Tests.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.3/test/xml/Export-XmlFilter.Tests.ps1)

[`Import-XmlFilter`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.3/docs/Import-XmlFilter.md)
