# Project created by the koncept

playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

scoreboard objectives add count_player_bingo dummy

tag @s add bingo.game.player

scoreboard players add count count_player_bingo 1