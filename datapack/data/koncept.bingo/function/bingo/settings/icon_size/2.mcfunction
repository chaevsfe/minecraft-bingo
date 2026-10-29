playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute if score @s bingo.icon.size matches ..15 run scoreboard players add @s bingo.icon.size 2
execute if score @s bingo.icon.size matches 16..31 unless score @s bingo.icon.size matches 17 run scoreboard players add @s bingo.icon.size 4
execute if score @s bingo.icon.size matches 33.. run scoreboard players set @s bingo.icon.size 32
scoreboard players reset @s bingo.settings.icon.size_2
scoreboard players enable @s bingo.settings.icon.size_2
function koncept.bingo:bingo/bossbar/start
