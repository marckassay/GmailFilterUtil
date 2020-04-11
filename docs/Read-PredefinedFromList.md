---
external help file: GmailFilterUtil-help.xml
Module Name: GmailFilterUtil
online version: https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/docs/Read-PredefinedFromList.md
schema: 2.0.0
---

# Read-PredefinedFromList

## SYNOPSIS
Reads a predefined list of string entries.

## SYNTAX

```
Read-PredefinedFromList [-ListName] <String[]> [[-BaseUri] <String>] [<CommonParameters>]
```

## DESCRIPTION

Currently the only predefined list, using the default `BaseUri` parameter is `recruiters.us`. That list can be view [here](https://raw.githubusercontent.com/marckassay/GmailFilterUtil/master/resources/recruiters.us.txt). The returned value from this function can be used in `Add-FromList` or `Set-FromList`.

## EXAMPLES

### Example 1

```powershell
PS C:\> $RecruiterEntries = Read-PredefinedFromList -ListName 'recruiters.us'
```

Downloads predefined entries for the 'recruiters.us' set.

## PARAMETERS

### -BaseUri
Defaults to:
    - <https://raw.githubusercontent.com/marckassay/GmailFilterUtil/master/resources/>

This value can is the prefix for `ListName`.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ListName
The txt filename where `BaseUri` points to.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:
Accepted values: recruiters.us

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (<http://go.microsoft.com/fwlink/?LinkID=113216).>

## INPUTS

### None

## OUTPUTS

### System.String[]

## NOTES

## RELATED LINKS

[Read-PredefinedFromList.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/src/list/Read-PredefinedFromList.ps1)

[Read-PredefinedFromList.Tests.ps1](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/test/list/Read-PredefinedFromList.Tests.ps1)

[`Set-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/docs/Set-FromList.md)

[`Add-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.4/docs/Add-FromList.md)
