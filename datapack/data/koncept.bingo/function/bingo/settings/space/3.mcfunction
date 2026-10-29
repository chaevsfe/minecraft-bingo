playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
tag @s add bingo.actionbar.top
tag @s remove bingo.actionbar.bottom
scoreboard players set @s bingo.space 0
scoreboard players reset @s bingo.adjustment_3
scoreboard players enable @s bingo.adjustment_3
function koncept.bingo:bingo/bossbar/start
