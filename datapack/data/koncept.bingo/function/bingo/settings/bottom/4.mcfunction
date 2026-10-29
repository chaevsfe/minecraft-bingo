playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
tag @s add bingo.actionbar.top
tag @s remove bingo.actionbar.bottom
scoreboard players remove @s bingo.vertical 10
scoreboard players reset @s bingo.items_bottom_4
scoreboard players enable @s bingo.items_bottom_4
function koncept.bingo:bingo/bossbar/start
