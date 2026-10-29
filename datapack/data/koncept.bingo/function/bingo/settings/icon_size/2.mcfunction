playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute if score @s bingo.icon.size matches ..20 run scoreboard players add @s bingo.icon.size 4
execute if score @s bingo.icon.size matches 25.. run scoreboard players set @s bingo.icon.size 24
scoreboard players reset @s bingo.settings.icon.size_2
scoreboard players enable @s bingo.settings.icon.size_2
function koncept.bingo:bingo/bossbar/start
