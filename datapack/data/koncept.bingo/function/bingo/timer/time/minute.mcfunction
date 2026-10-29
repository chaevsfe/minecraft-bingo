# Project created by the koncept

scoreboard players set s bingo.timer.game 0

scoreboard players add m bingo.timer.game 1
execute if score m bingo.timer.game matches 60 run function koncept.bingo:bingo/timer/time/hour

#Notifications every 10 minutes
scoreboard players operation $m.copy bingo.timer.game = m bingo.timer.game
scoreboard players operation $m.copy bingo.timer.game %= $constant_10 bingo.timer.game
