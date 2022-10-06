# CoinFlip

## Table of Contents
- [CoinFlip](#coinflip)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
  - [Instructions](#instructions)
  - [Game example](#game-example)
  - [Code](#code)

## About
This is an example of coin flip challenge. You will find instructions, code and game example in this repo.
Feel free to improve it and share it with me! :)

## Instructions
Challenge (An interview question): 
Two friends start a sequence of coin tosses. Friend A wins if HH comes first. Friend B wins if TH comes first. Who has a higher probability of winning and what are those probabilities?

Write an R program that plays the above game a 1000 times. (Hint: write a for loop that runs 1000 times. Each time it keeps tossing a coin until one of the friend wins.  When a friend wins you note who won, abort the game and start a new game.).
Note, if you do not abort the game then it changes the probability of winning for Friend A. E.g. if TH wins for B, but instead of aborting, you continue then THH allows A to win in just a single trial after the last game. This is not allowed: A must get two heads in a new game to win. 

## Game example
Based on instructions, here are some game examples:

Scenario 1:
Head + Head -> player A wins

Scenario 2:
Tail + Head -> player B wins

Scenario 3:
Head + Tail + Head -> player B wins
Once tail occurs, sequence is restarted for player A and sequence starts for player B.

Scenario 4:
Tail + Tail + Head -> player B wins
On first flip the sequence starts for player B but it restarts on second flip. On third flip, the sequence finishes and player B wins.


## Code
There is CoinFlip.R file where you can fine the code. You can either copy code, download, fork it, clone it, etc... Up to you how you would like to access the code. Just do remember to credit this repo if you do any changes.

Do note that there aren't any libraries that are used (for simplicity). If you would like to do some fancy graphs, ggplot2 is what I would use.