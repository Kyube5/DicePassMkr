$Wordlist = 'C:\Users\qbelkacem\Documents\_Work\Scripts\Powershell\DicePassMkr\eff_large_wordlist.csv'

$Words = Import-CSV -Path $Wordlist -Delimiter ";" -Header ID, Word
$Password = ""
For ($i = 0; $i -lt 2; $i++) { 
    $Dice = ""
    For ($j = 0; $j -lt 5; $j++) { 
        $D = Get-Random -Minimum 1 -Maximum 6 
        $Dice = $Dice + $D.ToString()
    }
    foreach ($Word in $Words) {
        if ($Word.ID -eq $Dice) {
            $Password = $Password + (Get-Culture).TextInfo.ToTitleCase($Word.Word)
        } 
    }
}

$Num = Get-Random -Minimum 100 -Maximum 999
Write-Host
Write-Host -ForegroundColor Blue $Password"%$"$Num
Write-Host

Pause