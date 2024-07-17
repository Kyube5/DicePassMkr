# DicePassMkr

Generate complex password with eff large wordlist

# Installation

Open script DicePassGen.ps1 in text editor to edit the path of the CSV file (line 10)
```bash
$Wordlist = '<Path_of_the_script>\DicePassGen\Wordlist.csv'
```

Create a shortcut on your Windows Desktop:
```bash
Location : "%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe <Path_of_the_script>\DicePassGen\DicePassGen.ps1"
```

You can change icone of the shortcut with "DicePassGen.ico" in the properties of the shortcut.


# Usage

Simply double-click on the shortcut and the password will be generated and displayed in a console

