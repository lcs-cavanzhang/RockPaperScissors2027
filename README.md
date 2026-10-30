# Rock Paper Scissors Water Fire
 
You against the computer. Click a move, and the computer picks one at random.
 
## How to play
 
1. Click **Rock**, **Paper**, **Scissors Water Bucket or Fire**
2. The computer shows its move beside yours.
3. win or lose rules:  Rock beats scissors and fire, Paper beats rock and water bucket, Scissors beats paper water bucket, Water bucket beats fire and rock, Fire beats paper scissors and same move ties. 
        

##           What I added 
- I added water bucket to the game.
- I dispayed the score for both the computer and the player.
- I clarified the wining condition using "if/ else if" simple logic.
- I added the "play again" button that resets everything.
- I found an unbalance in the game, becasue water bucket has more wining condition, so I dicided to add fire.
- I added the current streak and the best streak both for me and the computer. 

## How it works
#### Picking the Winner
Variables used: playerMove holds the move you picked, and computerMove holds the move the computer picked. Both are String types.
Operators used: I used == to check if both choices match for a tie, && (AND) to check a player move alongside a computer move, and || (OR) to combine all ten winning combinations into one statement.
Why I chose || over ten separate else if statements: Instead of typing result = "You win!", playerScore += 1, and updateStreak(won: true) ten separate times in ten different code blocks, combining all winning pairs with || lets me write those winning lines just once. This keeps the code clean and easy to update later.

#### Winning Streaks
Variables used: playerStreak and computerStreak are Int variables that count how many wins in a row each player has. playerBestStreak and computerBestStreak are Int variables that remember the highest streak reached during the session.
Function parameter: I wrote a function called updateStreak(won: Bool) that takes a single parameter named won. It receives true when the player wins and false when the computer wins.
Decision logic: Inside updateStreak, an if / else statement adds 1 to the winner's current streak and resets the loser's streak back to 0. Then, an if statement checks if the new streak is higher than the best streak, and updates it if a new record is set.

 
## Credits
 
- The starting game was written by Mr. Gordon.
- I asked gemini for a little help for the wining condition and the streak displaying.
- Some help from Mr. Gordon for adding the "again button"
-

## Testing

| my pick | computer pick | should happen | what did happen |
| --- | --- | --- | --- |
|  scissors|water bucket | I win |  I win |
| rock |  water bucket |  computer wins |  computer wins |
| paper |  water bucket | I win |  I win |
|  water bucket |  waterbucket|  tie|  tie|
|  water bucket |fire|  I win |  I win |

|  behavior| should happen | did happen |
| --- | --- | --- |
|  press the "play again" |  reset everything |reset everything|

| result | what should happen | did happen |
| --- | --- | --- |
|  I win |  my current streak plus 1 |my current streak plus 1 |
|  Computer wins |  computer's current streak plus 1 |  computer's current strak plus 1 |
| I lost |  My streak resets to zero |My streak resets to zero |
| Computer lost |  Computer's streak resets to zero |  Computer's streak resets o zero |
| My current streak is bigger than my best streak |My current streak replace my best streak  |My current streak replace my best streak|
|  Computer's current streak is bigger than its best streak |Computer's current streak is bigger than its best streak  |Computer's current streak is bigger than its best streak  |
