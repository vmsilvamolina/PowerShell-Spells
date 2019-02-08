function Get-AllSpells {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        $infoRaw = ([System.string](Invoke-WebRequest "https://raw.githubusercontent.com/vmsilvamolina/PowerShell-Spells/master/spells.md").content).Split("`n") | Where-Object {$_ -ne ""}
        $textRaw = [System.String]::Join("`n",$infoRaw -notmatch '(^\s*$|^# )')
        $spells = New-Object System.Collections.ArrayList
        [regex]$regex = "## (.+?)\n(^`|.+)"
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
    [CmdletBinding()]
    param (

    )
    
    begin {
        $spells = Get-AllSpells
    }
    
    process {
        $randomNumber = Get-Random -Maximum $spells.Count
        Write-host "`n  Spell n°$randomNumber" -ForegroundColor Green
        Write-host "  >" $spells[$randomNumber].Title":"`n -ForegroundColor Green
        Write-host "  "$spells[$randomNumber].Spell `n -ForegroundColor Blue
    }
    
    end {
    }
}
