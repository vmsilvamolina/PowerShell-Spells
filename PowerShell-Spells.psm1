function Get-AllSpells {

<#
.SYNOPSIS
    Get-AllSpells returns a list of all available spells in the PowerShell Spells module.

.DESCRIPTION
    The Get-AllSpells command retrieves a comprehensive list of all spells in the PowerShell Spells module.
    These spells are on-liner tricks that can be used with PowerShell to expand your knowledge 
    of the language and provide fun information to explore without leaving the console.
 
.EXAMPLE
    Get-AllSpells

    The command will display a result similar to the one below:

    Title                                                 Spell
    -----                                                 -----
    Change the console color                              $host.UI.RawUI.BackgroundColor = "Black"; Clear-Host
    Replace multiple spaces with a comma                  $text = 'Hello          World'; $text -replace '\s\s+', ","
    Rename a folder using the Move method                 [System.IO.Directory]::Move('C:\Test\FolderName','C:\Test\FolderNewName')
    ...                                                   ... 

.LINK
    https://github.com/vmsilvamolina/PowerShell-Spells

#>

    [CmdletBinding()]
    param (
        
    )
    
    begin {
        $infoRaw = ([System.string](Invoke-WebRequest "https://raw.githubusercontent.com/vmsilvamolina/PowerShell-Spells/master/spells.md").content).Split("`n") | Where-Object {$_ -ne ""}
        $textRaw = [System.String]::Join("`n",$infoRaw -notmatch '(^\s*$|^# )')
        $spells = New-Object System.Collections.ArrayList
        [regex]$regex = "## (.+?)\n``+\n(.+)\n`+"
    }
    
    process {
        $regex.Matches($textRaw) |
            ForEach-Object {
                $spell = New-Object System.Object
                $spell | Add-Member -MemberType NoteProperty -Name "Title" -Value $_.Groups[1].Value
                $spell | Add-Member -MemberType NoteProperty -Name "Spell" -Value $_.Groups[2].Value
                $spells.Add($spell) | Out-Null
            }
        return $spells
    }
    
    end {
    }
}

function Get-Spell {

<#
.SYNOPSIS
    Get-Spell returns one of all available spells in the PowerShell Spells module, randomly.

.DESCRIPTION
    The Get-Spell command retrieves a random spell from the PowerShell Spells module.
    These spells are on-liner tricks that can be used with PowerShell to expand your knowledge 
    of the language and provide fun information to explore without leaving the console.
 
.EXAMPLE
    Get-Spell

    To retrieve one of all available spells:

    Spell number: 14
    > Create a symbolic link :

    New-Item -Path C:\LinkDir -ItemType SymbolicLink -Value F:\RealDir

.LINK
    https://github.com/vmsilvamolina/PowerShell-Spells
#>

    [CmdletBinding()]
    param (

    )
    
    begin {
        $spells = Get-AllSpells
    }
    
    process {
        $randomNumber = Get-Random -Maximum $spells.Count
        Write-host "`n  Spell number: $randomNumber" -ForegroundColor Green
        Write-host "  >" $spells[$randomNumber].Title":"`n -ForegroundColor Green
        Write-host "  "$spells[$randomNumber].Spell `n -ForegroundColor Blue
    }
    
    end {
    }
}