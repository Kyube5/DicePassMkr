###################################################################
#Script Name	: DicePassGen.ps1                                                                                              
#Description	: Strong password generation script based on EFF Dice-Generated Passphrases (between 11 & 23 characters)                                                                                                                                                                      
#Author       	: Quentin BELKACEM                                               
#Email         	: quentin.belkacem@gmail.com                                           
###################################################################

# Variables
$Wordlist = ‘<Path_of_the_script>\DicePassGen\Wordlist.csv’

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
    Write-Host -ForegroundColor Blue $Password$Chars$Num
}

Write-Host

Pause
