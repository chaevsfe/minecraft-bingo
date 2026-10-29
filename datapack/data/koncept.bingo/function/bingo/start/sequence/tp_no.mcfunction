# Project created by the koncept

playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

execute if score tp bingo.type.tp matches 0 run execute as @s at @s run function koncept.bingo:bingo/start/sequence/2_1

execute if score tp bingo.type.tp matches 0 run scoreboard players set tp bingo.type.tp 2

scoreboard players reset @p bingo.tp_no

#trigger bingo.tp_yes