# Project created by the koncept

playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

execute if score @s bingo.dynamic.advancement matches 0 run function koncept.bingo:bingo/start/sequence/2_2

scoreboard players set dynamic.lock bingo.dynamic.advancement 1

scoreboard players reset @s bingo.dynamic.advancement.enabled