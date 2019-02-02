# PowerShell-Spells

## Change the console color

`$host.UI.RawUI.BackgroundColor = "Black"; Clear-Host`

## Replace multiple spaces with a comma

`$text = 'Hello          World'` \
`$text -replace '\s\s+', ","`

## Rename a folder using the Move method
`[System.IO.Directory]::Move('C:\Test\FolderName','C:\Test\FolderNewName')`
