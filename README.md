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
