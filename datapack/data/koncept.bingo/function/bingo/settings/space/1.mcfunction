playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
tag @s add bingo.actionbar.top
tag @s remove bingo.actionbar.bottom
scoreboard players remove @s bingo.space 10
scoreboard players reset @s bingo.adjustment_1
scoreboard players enable @s bingo.adjustment_1
function koncept.bingo:bingo/bossbar/start
