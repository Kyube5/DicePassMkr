<#

.SYNOPSIS
    Strong password generation script based on EFF Dice-Generated Passphrases (between 11 & 23 characters).

.DESCRIPTION
    Strong password generation script based on EFF Dice-Generated Passphrases (between 11 & 23 characters).
    
.NOTES
    NAME:       DicePassMkr.ps1
    AUTHOR:     BELKACEM Quentin
    EMAIL:      quentin.belkacem@gmail.com
    OWNER:      

    VERSION HISTORY:
    1.0  2024.02.14  Initial Version
    2.0  2024.07.20  Generation of ten passwords

#>

Write-Host -ForegroundColor DarkCyan @"

  8OOo.                8OOo.                   8o.o8
  8   8  8 .oOo. .oOo. 8   O .oOo. oOOOo oOOOo 8 8 8 8  8 8OOo.
  8   8  8 8     8oo   8ooO' 8ooo8 'Ooo, 'Ooo, 8 8 8 8o8  8ooo'
  8OOO'  8 'OoO' 'OoO' 8     8   8 Oooo0 Oooo0 8 8 8 8  8 8   8

oOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOo0oOoOoOoO

"@

# Variables
$Wordlist = "<Path_of_the_script>\DicePassMkr\Wordlist.csv"

# Import the CSV file containing the words
$Words = Import-CSV -Path $Wordlist -Delimiter ";" -Header ID, Word

# Loop to generate the 10 passwords
For ($k = 0; $k -lt 10; $k++) {
    $Password = ""
    # Loop to generate the two words
    For ($i = 0; $i -lt 2; $i++) {
        $Dice = ""
        # Loop to roll the 5 dices and generate a word ID
        For ($j = 0; $j -lt 5; $j++) {
            $D = Get-Random -Minimum 1 -Maximum 6
            $Dice = $Dice + $D.ToString()
        }
        # Loop to retrieve words from the CSV file
        foreach ($Word in $Words) {
            if ($Word.ID -eq $Dice) {
                # Add words to the $Password variable + add capital letters to the beginning of the word
                $Password = $Password + (Get-Culture).TextInfo.ToTitleCase($Word.Word)
            }
        }
    }

    # Loop to generate special characters
    $Chars = ""
    For($l=0;$l -lt 3;$l++){
        $SpecialChars = @('!','#','$','%','&','*','+','=','?','@')
        $RandomChar = Get-Random -input $SpecialChars
        $Chars = $Chars + $RandomChar
    }

    # Generation of three digital characters
    $Num = Get-Random -Minimum 100 -Maximum 999

    # Assembling and displaying the password in the console
    Write-Host
    Write-Host -ForegroundColor Cyan $Password$Chars$Num
}

Write-Host

Pause
