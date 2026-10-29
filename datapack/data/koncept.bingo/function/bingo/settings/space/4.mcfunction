playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
tag @s add bingo.actionbar.top
tag @s remove bingo.actionbar.bottom
scoreboard players add @s bingo.space 1
scoreboard players reset @s bingo.adjustment_4
scoreboard players enable @s bingo.adjustment_4
function koncept.bingo:bingo/bossbar/start
