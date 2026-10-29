# Project created by the koncept

### Looping functions
# Timer
execute if score start bingo.timer.game matches 1 run function koncept.bingo:bingo/timer/main
# Randomization of objects
execute if score start bingo.start.spawn.item matches 1.. run function koncept.bingo:bingo/start/generate_random_object
# Beginning of game
execute if score start bingo.start.enable.trigger matches 1.. run function koncept.bingo:bingo/start/sequence/4_main
# Destroy flask
execute as @e[type=minecraft:marker,tag=bingo.destroy,tag=bingo.destroy.start] at @s run function koncept.bingo:bingo/start/destroy
# Win
execute if score bingo.win.restart bingo.win.restart matches 1.. run function koncept.bingo:bingo/win/restart/main

execute as @a[tag=bingo.game.player] at @s run function koncept.bingo:bingo/main/player