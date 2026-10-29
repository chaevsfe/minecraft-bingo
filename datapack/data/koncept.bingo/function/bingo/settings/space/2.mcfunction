playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
tag @s add bingo.actionbar.top
tag @s remove bingo.actionbar.bottom
scoreboard players remove @s bingo.space 1
scoreboard players reset @s bingo.adjustment_2
scoreboard players enable @s bingo.adjustment_2
function koncept.bingo:bingo/bossbar/start
