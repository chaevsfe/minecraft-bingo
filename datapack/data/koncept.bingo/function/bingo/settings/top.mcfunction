playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
tag @s add bingo.actionbar.top
tag @s remove bingo.actionbar.bottom
scoreboard players set @s bingo.vertical 0
scoreboard players reset @s bingo.items_top
scoreboard players enable @s bingo.items_top
function koncept.bingo:bingo/bossbar/start
