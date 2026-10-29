# Project created by the koncept

scoreboard players reset @s .bingo.start

# if
# Do not continue if the game is already in progress
execute if score start bingo.start.launch.receipt matches 1 run return run function koncept.bingo:bingo/start/sequence/message/started_game

# else
# If the game is not going then start it
function koncept.bingo:bingo/start/sequence/2

#execute if score start bingo.start.launch.receipt matches 1 run function koncept.bingo:bingo/start/sequence/message/started_game

#execute if score start bingo.start.launch.receipt matches 0 run function koncept.bingo:bingo/start/sequence/2