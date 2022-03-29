$Menu = "LOOP";
$CHOICE = "";
$Min = 1;
$Max = 10;
$NumbersToGuess = 3;
$NumberGuessesPerNumber = 3;
$GUESS = 0;
$Score = 0;
$The_Number = Get-Random -Minimum $Min -Maximum($Max + 1);

Clear;
Write("`nWelcome to Number Guessing Game`n");
Write("`nYou have" + $NumbersToGuess + "chances to guess`n");

while($Menu -eq "LOOP") {
    Clear;
    
    Write("--------------------------------------------------");
    Write("|          Choose a level of difficulty          |");
    Write("|          1 = EASY (1-5)                        |");
    Write("|          2 = NORMAL (1-10)                     |");
    Write("|          3 = HARD (1-100)                      |");
    Write("--------------------------------------------------");

    $CHOICE = Read-Host("CHOICE?");

    switch($CHOICE) {
        1 {
            $Min = 1;
            $Max = 5;
            $Menu = "EXIT";
        }
        2 {
            $Min = 1;
            $Max = 10;
            $Menu = "EXIT";
        }
        3 {
            $Min = 1;
            $Max = 100;
            $Menu = "EXIT";
        }
        default {
            Write("`nInvalid CHOICE. Choose again.");
            Read-Host("Press Enter to continue");
        }
    }
}

for($x = 0; $x -lt $NumbersToGuess; $x++) {
    $The_Number = Get-Random -Minimum $Min -Maximum ($Max + 1);

    Write("`n---------------------------------------");
    Write("Guessing for Number: " + ($x+1) + "");
    
    Write("`nNumber " + ($x+1) + " is between " + $Min + " and " + $Max + ".");
    
    for($z = 0; $z -lt $NumbersToGuessesPerNumber; $z++) {
        [Int]$GUESS = Read-Host("`nAttempt # " + ($z+1) + "?");

        if($GUESS -lt $Min) {
            Write("Invalid guess. Less than minimum.");
        } elseif($GUESS -gt $Max) {
            Write("Invalid guess. Greater than maximum.");
        } else {
            Write("Guess is valid - within range.");

            if($GUESS -eq $The_Number) {
                Write("You did it! You guessed my number.");
                $Score++;
                $z = 3;
            } elseif($GUESS -gt $The_Number) {
                Write("My number was smaller.");
            } else {
                Write("My number was bigger");
            }
        }
    }
    Write("`nMy number was: " + $The_Number + "");
    Write("Score: " + $Score + "");
}