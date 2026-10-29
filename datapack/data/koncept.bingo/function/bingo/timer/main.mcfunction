# Project created by the koncept

execute as @a[tag=bingo.game.visibility,scores={bingo.timer.game.settings=1},tag=!bingo.no.timer.visibility] at @s run function koncept.bingo:bingo/timer/display

execute as @a[tag=bingo.no.timer.visibility] at @s run function koncept.bingo:bingo/timer/no_display

scoreboard players add t bingo.timer.game 1

execute if score t bingo.timer.game matches 20 run function koncept.bingo:bingo/timer/time/tick
