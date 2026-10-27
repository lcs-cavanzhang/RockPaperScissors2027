//
//  RockPaperScissorsView.swift
//  RockPaperScissors
//
//  WHAT THIS GAME DOES NOW
//  You pick rock, paper or scissors. The computer picks one at random.
//  The app shows both moves and counts how many rounds you have played.
//  It can tell when a round is a tie.
//
//  WHAT IT DOES NOT DO YET
//  When the two moves are different, it only says "Someone won".
//  It does not know who!
//  Rock beats scissors, scissors beats paper, and paper beats rock.
//

import SwiftUI

// The picture for each move. These are emoji, so they are just text.
// TRY: Change these to other emoji to give the game a new theme.
let rockEmoji: String = "🪨"
let paperEmoji: String = "📄"
let scissorsEmoji: String = "✂️"
let waterBucketEmoji: String = "🪣"
let fireEmoji: String = "🔥"

// The game itself: what it remembers, what it shows on the screen,
// and what it does when you click a button.
struct RockPaperScissorsView: View {
    
    // MARK: - Stored properties
    
    // Each @State variable is something the game remembers.
    // When one of them changes, the screen updates by itself.
    
    // The name of each move, such as "Rock", and the emoji that shows it.
    // Before the first round, nobody has picked a move yet.
    @State var playerMove: String = "No move yet"
    @State var playerEmoji: String = "❓"
    @State var computerMove: String = "No move yet"
    @State var computerEmoji: String = "❓"
    
    // What happened in the last round.
    @State var result: String = "Let's play!"
    
    // Keep track of player's score
    @State var playerScore: Int = 0
    
    // Keep track of computer's score
    @State var computerScore: Int = 0
    
    // How many rounds have been played.
    @State var roundsPlayed: Int = 0
    
    // Keep track of player's streak
    @State var playerStreak: Int = 0
    @State var playerBestStreak: Int = 0
    
    // Keep track of computer's streak
    @State var computerStreak: Int = 0
    @State var computerBestStreak: Int = 0
    
    // MARK: - Computed properties
    
    var body: some View {
        VStack(spacing: 24) {
            
            // The title at the top of the screen.
            Text("Rock Paper Scissors Waterbucket and Fire")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.teal)
            // Shrink the title a little if it does not fit on one line.
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            // The two moves, side by side.
            HStack {
                VStack(spacing: 8) {
                    Label("You", systemImage: "person.fill")
                        .font(.headline)
                    Text(playerEmoji)
                        .font(.system(size: 90))
                    Text(playerMove)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
                
                Text("vs")
                    .font(.title)
                    .foregroundStyle(Color.secondary)
                
                VStack(spacing: 8) {
                    Label("Computer", systemImage: "desktopcomputer")
                        .font(.headline)
                    Text(computerEmoji)
                        .font(.system(size: 90))
                    Text(computerMove)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            .background(Color.teal.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            // The result of the round.
            Text(result)
                .font(.largeTitle)
                .bold()
            
            // The player's score and streak
            VStack(spacing: 4) {
                Text("Player score is: \(playerScore)")
                    .font(.title2)
                    .bold()
                Text("Current streak: \(playerStreak)  |  Best streak: \(playerBestStreak)")
                    .font(.headline)
                    .foregroundStyle(Color.secondary)
            }
            
            // The computer's score and streak
            VStack(spacing: 4) {
                Text("Computer score is: \(computerScore)")
                    .font(.title2)
                    .bold()
                Text("Current streak: \(computerStreak)  |  Best streak: \(computerBestStreak)")
                    .font(.headline)
                    .foregroundStyle(Color.secondary)
            }
            
            Spacer()
            
            // One button for each move the player can make.
            // The code inside the braces runs when that button is clicked.
            Text("Choose your move")
                .font(.headline)
                .foregroundStyle(Color.secondary)
            
            HStack(spacing: 12) {
                Button {
                    chooseRock()
                } label: {
                    VStack {
                        Text(rockEmoji)
                            .font(.system(size: 44))
                        Text("Rock")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    choosePaper()
                } label: {
                    VStack {
                        Text(paperEmoji)
                            .font(.system(size: 44))
                        Text("Paper")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    chooseScissors()
                } label: {
                    VStack {
                        Text(scissorsEmoji)
                            .font(.system(size: 44))
                        Text("Scissors")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    chooseWaterBucket()
                } label: {
                    VStack {
                        Text(waterBucketEmoji)
                            .font(.system(size: 44))
                        Text("Water Bucket")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    chooseFire()
                } label: {
                    VStack {
                        Text(fireEmoji)
                            .font(.system(size: 44))
                        Text("Fire")
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.bordered)
            .font(.headline)
            // TRY: Change teal to another colour. Change it in the title and the moves box too.
            .tint(Color.teal)
            
            Text("Rounds played: \(roundsPlayed)")
                .font(.headline)
                .foregroundStyle(Color.secondary)
            
            Button {
                startNewGame()
            } label: {
                Text("again")
            }
            
        }
        .padding(32)
        .fontDesign(.rounded)
        // How big the game's window is on the Mac. It can be made taller or wider.
        .frame(minWidth: 520, minHeight: 700)
    }
    
    // MARK: - Functions
    
    // Updates the streaks for the player and computer based on whether the player won
    func updateStreak(won: Bool) {
        if won == true {
            // Player won
            playerStreak += 1
            computerStreak = 0
            
            if playerStreak > playerBestStreak {
                playerBestStreak = playerStreak
            }
        } else {
            // Computer won
            computerStreak += 1
            playerStreak = 0
            
            if computerStreak > computerBestStreak {
                computerBestStreak = computerStreak
            }
        }
    }
    
    // Sets everything back to the way it was at the start.
    func startNewGame() {
        playerScore = 0
        computerScore = 0
        roundsPlayed = 0
        playerStreak = 0
        playerBestStreak = 0
        computerStreak = 0
        computerBestStreak = 0
        result = "Let's play!"
        playerMove = "No move yet"
        playerEmoji = "❓"
        computerMove = "No move yet"
        computerEmoji = "❓"
    }
    
    // The player picked rock.
    func chooseRock() {
        playerMove = "rock"
        playerEmoji = rockEmoji
        playRound()
    }
    
    // The player picked paper.
    func choosePaper() {
        playerMove = "paper"
        playerEmoji = paperEmoji
        playRound()
    }
    
    // The player picked scissors.
    func chooseScissors() {
        playerMove = "scissors"
        playerEmoji = scissorsEmoji
        playRound()
    }
    
    // The player picked waterBucket.
    func chooseWaterBucket() {
        playerMove = "water bucket"
        playerEmoji = waterBucketEmoji
        playRound()
    }
    
    // The player picked fire.
    func chooseFire() {
        playerMove = "fire"
        playerEmoji = fireEmoji
        playRound()
    }
    
    // The computer picks its move at random.
    func chooseComputerMove() {
        
        // Pick 1, 2, 3, 4 or 5. Each number stands for one move.
        let randomNumber: Int = Int.random(in: 1...5)
        
        if randomNumber == 1 {
            computerMove = "rock"
            computerEmoji = rockEmoji
        } else if randomNumber == 2 {
            computerMove = "paper"
            computerEmoji = paperEmoji
        } else if randomNumber == 3 {
            computerMove = "scissors"
            computerEmoji = scissorsEmoji
        } else if randomNumber == 4 {
            computerMove = "water bucket"
            computerEmoji = waterBucketEmoji
        } else {
            computerMove = "fire"
            computerEmoji = fireEmoji
        }
    }
    
    // Plays one round, once the player has picked a move.
    func playRound() {
        chooseComputerMove()
        roundsPlayed += 1
        
        if playerMove == computerMove {
            result = "It's a tie!"
        } else if playerMove == "rock" && computerMove == "scissors" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else if playerMove == "rock" && computerMove == "fire" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else if playerMove == "paper" && computerMove == "rock" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else if playerMove == "paper" && computerMove == "water bucket" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else if playerMove == "scissors" && computerMove == "paper" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else if playerMove == "scissors" && computerMove == "water bucket" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else if playerMove == "water bucket" && computerMove == "fire" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else if playerMove == "water bucket" && computerMove == "rock" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else if playerMove == "fire" && computerMove == "paper" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else if playerMove == "fire" && computerMove == "scissors" {
            result = "You win!"
            playerScore += 1
            updateStreak(won: true)
        } else {
            result = "Computer wins!"
            computerScore += 1
            updateStreak(won: false)
        }
    }
}

#Preview {
    RockPaperScissorsView()
}
