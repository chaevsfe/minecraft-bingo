# Project created by the koncept

playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

tag @s add bingo.actionbar.top

tag @s remove bingo.actionbar.bottom

scoreboard players set @s bingo.icon.size 16

scoreboard players set @s bottom.gui.Scale 1

scoreboard players set @s bingo.space 0
scoreboard players set @s bingo.vertical 0

scoreboard players reset @s bingo.reset.settings

scoreboard players enable @s bingo.reset.settings

function koncept.bingo:bingo/bossbar/start


