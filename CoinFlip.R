##====================================================================================================
#  ________   ________   ________    ________           ________   ________   ________   _______      
# |\_____  \ |\   __  \ |\   ___  \ |\   ____\         |\   ____\ |\   __  \ |\   ___ \ |\  ___ \     
#  \|___/  /|\ \  \|\  \\ \  \\ \  \\ \  \___|_        \ \  \___| \ \  \|\  \\ \  \_|\ \\ \   __/|    
#      /  / / \ \   __  \\ \  \\ \  \\ \_____  \        \ \  \     \ \  \\\  \\ \  \ \\ \\ \  \_|/__  
#     /  /_/__ \ \  \ \  \\ \  \\ \  \\|____|\  \        \ \  \____ \ \  \\\  \\ \  \_\\ \\ \  \_|\ \ 
#    |\________\\ \__\ \__\\ \__\\ \__\ ____\_\  \        \ \_______\\ \_______\\ \_______\\ \_______\
#     \|_______| \|__|\|__| \|__| \|__||\_________\        \|_______| \|_______| \|_______| \|_______|
#                                      \|_________|                                                   
##====================================================================================================


# Game instructions:
# HH -> player A wins
# TH -> player B wins
# it needs to be in a sequence to get a point
# if a sequence is broken, count restarts

# H (head) = 0
# T (tail) = 1

# Set score counts for game wins
playerAGameScore <- playerBGameScore <- 0

# Loop for 1000 games
for (x in 1:1000) {
  # Set the default values of players A and B as 0
  playerA <- playerB <- 0 
  
  # Loop until there is winner in the game
  while (TRUE){
    # Flip a coin and save it to the variable CF
    cf <- sample(c(0,1), size=1, replace = TRUE) 
    if(cf == 0){ # Check if coin flip is 0
      playerA <- playerA + 1 # Increase player A score by 1
      
      if(playerB == 1){ # Check if player B has already gotten the score of 1 - has a streak
        playerB <- playerB + 1 # Increase player B score by 1
      }
    } else if(cf == 1){ #Check if coin flip is 1
      if(playerB == 0){ # Check if player B score is 0 so the streak can start
        playerB <- playerB + 1 # Increase player B score by 1
      }else{ # If the score is not 0, restart the count since the streak has been broken
        playerB <- 0 # Restart the count of sequence
      }
      
      playerA <- 0 # We need to restart count sequence for player A since streak broke
    } 
    
    if(playerA == 2){ # Check if player A has won 2 turns
      playerAGameScore <- playerAGameScore + 1 # Increase game score of player A
      break # Exit the loop
    }else if(playerB == 2){ # Check if player B has won 2 turns
      playerBGameScore <- playerBGameScore + 1 # Increase game score of player A
      break # Exit the loop
    }
  }
}

# Calculate % of wins and round them to 2 digits
playerAPerc <- round(playerAGameScore/1000, digits = 2)
playerBPerc <- round(playerBGameScore/1000, digits = 2)

# Print player scores and %
cat(sprintf("Player A score is: %i | %s%%\nPlayer B score is: %i | %s%%",
            playerAGameScore,
            playerAPerc,
            playerBGameScore,
            playerBPerc
            ))

# Create a pie plot of scores
pie(c(playerAGameScore,playerBGameScore),
    labels = c("Player A","Player B"),
    main = "Pie plot of win ratio")