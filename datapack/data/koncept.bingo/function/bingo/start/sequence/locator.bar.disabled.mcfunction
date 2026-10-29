# Project created by the koncept

playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

execute if score @s bingo.dynamic.locator.bar matches 0 run function koncept.bingo:bingo/start/sequence/3

gamerule locator_bar false

scoreboard players reset @s bingo.dynamic.locator.bar.disabled