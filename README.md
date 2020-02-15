# GmailFilterUtil

This module was created to the following reasons:

- _Unable to edit large filter lists in Gmail_. It seems that Gmail doesn't allow editing large filter sets without receiving an error popup. For whatever reason why this is, I "quickly" created this module for that reason.
- _Quickly update your filter list_. Although this requires additional steps, to be done in Gmail, this module allows you update your local Xml filter file to be uploaded anytime afterwards.
- _To share predefined filter lists_. From recent recruiters contacting me, I found myself inundated to the point I was avoiding to view my account. Filters are a powerful tool in Gmail, or other email providers, so that you can avoid even see or needing to delete messages.

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/marckassay/GmailFilterUtil/blob/master/LICENSE)
[![PS Gallery](https://img.shields.io/badge/install-PS%20Gallery-blue.svg)](https://www.powershellgallery.com/packages/GmailFilterUtil/)

## Examples

When you have a exported filter from your Gmail account, you can update it by doing this following:

```powershell
Import-XmlFilter -Path 'C:\temp\mailFilters.xml' | `
  Add-FromList -Value "*@aerotek.com" | `
  Export-XmlFilter -Path 'C:\temp\mailFilters.xml'
```

This example uses the `Add-FromList` function to add in juxapose to `Set-FromList` that sets the value of `Value` parameter as-is. This PowerShell Verb behavior aligns with PowerShell's `Add-Context` and `Set-Context` functions.

Another example, is to use a predefined list of enteries, for instance, the `recruiters.us` list:

```powershell
$RecruiterEntries = Get-FromList -ListName 'recruiters.us'
$RecruiterEntries += '*@techcorpsystems.com'
$RecruiterEntries | Export-XmlFilter -Path 'C:\temp\mailFilters.xml'
```

Above, an additional entry is added to `GmailFilter` datatype and exported back to `mailFilter.xml` file.

## API

#### [`Add-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/master/docs/Add-FromList.md)

Adds entries to a From list. 

#### [`Export-XmlFilter`](https://github.com/marckassay/GmailFilterUtil/blob/master/docs/Export-XmlFilter.md)

Exports PowerShell data back to Gmail exported filter. 

#### [`Get-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/master/docs/Get-FromList.md)

Get predefined list of string entries. 

#### [`Import-XmlFilter`](https://github.com/marckassay/GmailFilterUtil/blob/master/docs/Import-XmlFilter.md)

Imports into PowerShell session, a Gmail exported filter. 

#### [`Set-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/master/docs/Set-FromList.md)

Sets entries to a From list.

