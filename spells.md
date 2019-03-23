# Spells

## Change the console color

```
$host.UI.RawUI.BackgroundColor = "Black"; Clear-Host
```

## Replace multiple spaces with a comma

```
$text = 'Hello          World'; $text -replace '\s\s+', ","
```

## Rename a folder using the Move method

```
[System.IO.Directory]::Move('C:\Test\FolderName','C:\Test\FolderNewName')
```

## Match with regex

```
"One line `rSecond line" -match '(^\r*)'
```

## Start a process maximized

```
Start-Process notepad.exe  -WindowStyle Maximized
```

## Wait for process to finish

```
while ((Get-Process Code -ErrorAction SilentlyContinue)) {Start-Sleep 5}
```

## Print an array with commas separating each element

```
[String]::Join(',', $array)
```

## Recursive folder list

```
Get-ChildItem "C:\Foo" -recurse | Where-Object {$_.Attributes -eq 'Directory'}
```

## Monitor a file in real time (Unix tail equivalent)

```
Get-Content -Path 'C:\crazy.log' -Tail 10 -Wait
```

## Display the help for all the parameters

```
Get-Help -Name Get-Process -Parameter *
```

## Use the PowerShell Registry Provider

```
Set-Location HKLM:
```

## Replace the first occurrence

```
[regex]$pattern = "Cloud"; $pattern.replace("Cloud is the best option", "Azure", 1)
```

## Recursively case-insensitive search for text in files

```
Get-ChildItem -Recurse -Filter *.cs | Select-String -Pattern "someText"
```

## Transfer data to or from the web (cURL)

```
Invoke-RestMethod https://github.com
```