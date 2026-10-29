playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute if score @s bingo.icon.size matches 17.. run scoreboard players remove @s bingo.icon.size 4
execute if score @s bingo.icon.size matches 9..16 unless score @s bingo.icon.size matches 13 run scoreboard players remove @s bingo.icon.size 2
execute if score @s bingo.icon.size matches ..7 run scoreboard players set @s bingo.icon.size 8
scoreboard players reset @s bingo.adjustment_6
scoreboard players enable @s bingo.adjustment_6
function koncept.bingo:bingo/bossbar/start
