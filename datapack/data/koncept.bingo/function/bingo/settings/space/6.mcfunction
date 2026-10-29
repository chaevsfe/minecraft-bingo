playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute if score @s bingo.icon.size matches 16.. run scoreboard players remove @s bingo.icon.size 4
execute if score @s bingo.icon.size matches ..11 run scoreboard players set @s bingo.icon.size 12
scoreboard players reset @s bingo.adjustment_6
scoreboard players enable @s bingo.adjustment_6
function koncept.bingo:bingo/bossbar/start
