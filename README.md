# GmailFilterUtil

This module has been created address the following:

- _Unable to edit large filter lists in Gmail_. It seems that Gmail doesn't allow editing large filter sets without receiving an error popup. For whatever reason why this is, I "quickly" created this module because of it.
- _Quickly update Gmail filter list_. Although, this requires additional steps to be done in Gmail, this module allows you to update your local Xml filter file to be uploaded anytime afterwards. Use the [`Add-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.2/docs/Add-FromList.md) function to add new entries.
- _To have predefined Gmail filter lists_. From the plethora of recruiters contacting me, I found myself inundated to the point I was avoiding to view my inbox. Filters are a powerful tool in Gmail, so that you can avoid even seeing or needing to delete messages, which is what I needed to filter recruiter messages. Having predefined lists makes enabling this process much less painful.

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/marckassay/GmailFilterUtil/blob/0.0.2/LICENSE)
[![PS Gallery](https://img.shields.io/badge/install-PS%20Gallery-blue.svg)](https://www.powershellgallery.com/packages/GmailFilterUtil/)

## Examples

In order to use this PowerShell module, you must download an initial filter from a Gmail account. It may be empty. Or it may just have a single entry. If needed, instructions can be found [here](https://support.google.com/mail/answer/6579) on managing Gmail filters.

When you have a exported filter from your Gmail account, you can update it by doing this following:

```powershell
Import-XmlFilter -Path 'C:\temp\mailFilters.xml' | `
  Add-FromList -Value "*@aerotek.com" | `
  Export-XmlFilter -Path 'C:\temp\mailFilters.xml'
```

This example uses the [`Add-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.2/docs/Add-FromList.md) function to add additional entries, as to juxtapose with [`Set-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.2/docs/Set-FromList.md), which sets the value of `Value` parameter as-is, removing any existing values. This function-verb behavior aligns with PowerShell's `Add-Context` and `Set-Context` functions.

Another example, is to use a predefined list of entries. For instance, the `recruiters.us` list:

```powershell
$RecruiterEntries = Get-FromList -ListName 'recruiters.us'
$RecruiterEntries += '*@techcorpsystems.com'
$RecruiterEntries | Export-XmlFilter -Path 'C:\temp\mailFilters.xml'
```

Above, an additional entry is added to `GmailFilter` data type and exported back to `mailFilter.xml` file.

## API

#### [`Add-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.2/docs/Add-FromList.md)

Adds entries to a From list.

#### [`Export-XmlFilter`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.2/docs/Export-XmlFilter.md)

Exports PowerShell data back to Gmail exported filter.

#### [`Get-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.2/docs/Get-FromList.md)

Get predefined list of string entries.

#### [`Import-XmlFilter`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.2/docs/Import-XmlFilter.md)

Imports into PowerShell session, a Gmail exported filter.

#### [`Set-FromList`](https://github.com/marckassay/GmailFilterUtil/blob/0.0.2/docs/Set-FromList.md)

Sets entries to a From list.
