class GmailFilter {
  <#
  <feed xmlns="http://www.w3.org/2005/Atom" xmlns:apps="http://schemas.google.com/apps/2006">
  #>
  static [hashtable]$AppsNameSpace = @{apps = "http://schemas.google.com/apps/2006" }

  <#
  <feed>
    <entry>
      <apps:property name="from" value="*@teksystems.com OR *@koltersolutions.com OR *@hays.com" />
    </entry>
  </feed>
  #>
  static [string]$FromXPath = "//apps:property[@name='from']"
    
  <#
  <feed>
    <entry>
      <apps:property name="label" value="Headhunter" />
    </entry>
  </feed>
  #>
  static [string]$LabelXPath = "//apps:property[@name='label']"
  
  <#
  <feed>
    <entry>
      <apps:property name="shouldTrash" value="true" />
    </entry>
  </feed>
  #>
  static [string]$ShouldTrashXPath = "//apps:property[@name='shouldTrash']"

  <#
  <feed>
    <entry>
      <apps:property name="shouldNeverMarkAsImportant" value="true" />
    </entry>
  </feed>
  #>
  static [string]$ShouldNeverMarkAsImportantXPath = "//apps:property[@name='shouldNeverMarkAsImportant']"

  [string]$AuthorName
  [string]$AuthorEmail
  [string]$From
  [string]$Label
  [bool]$ShouldTrash
  [bool]$ShouldNeverMarkAsImportant
  [string]$SizeOperator
  [string]$SizeUnit

  GmailFilter() { }
}