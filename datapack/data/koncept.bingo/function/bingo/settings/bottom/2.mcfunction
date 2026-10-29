playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
tag @s add bingo.actionbar.top
tag @s remove bingo.actionbar.bottom
scoreboard players add @s bingo.vertical 1
scoreboard players reset @s bingo.items_bottom_2
scoreboard players enable @s bingo.items_bottom_2
function koncept.bingo:bingo/bossbar/start
