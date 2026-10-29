# Project created by the koncept
#vote.line
scoreboard players enable @a bingo.vote.line
execute as @a[scores={bingo.vote.line=1..}] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={bingo.vote.line=1..},tag=!bingo.vote.line] at @s run scoreboard players add vote.line bingo.vote.type 1
execute as @a[scores={bingo.vote.line=1..},tag=bingo.vote.cross] at @s run scoreboard players remove vote.cross bingo.vote.type 1
execute as @a[scores={bingo.vote.line=1..},tag=bingo.vote.full_house] at @s run scoreboard players remove vote.full_house bingo.vote.type 1
tag @a[scores={bingo.vote.line=1..},tag=!bingo.vote.line] remove bingo.vote.cross
tag @a[scores={bingo.vote.line=1..},tag=!bingo.vote.line] remove bingo.vote.full_house
tag @a[scores={bingo.vote.line=1..},tag=!bingo.vote.line] add bingo.vote.line
scoreboard players reset @a[scores={bingo.vote.line=1},tag=bingo.vote.line] bingo.vote.line
#vote.cross
scoreboard players enable @a bingo.vote.cross
execute as @a[scores={bingo.vote.cross=1..}] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={bingo.vote.cross=1..},tag=!bingo.vote.cross] at @s run scoreboard players add vote.cross bingo.vote.type 1
execute as @a[scores={bingo.vote.cross=1..},tag=bingo.vote.line] at @s run scoreboard players remove vote.line bingo.vote.type 1
execute as @a[scores={bingo.vote.cross=1..},tag=bingo.vote.full_house] at @s run scoreboard players remove vote.full_house bingo.vote.type 1
tag @a[scores={bingo.vote.cross=1..},tag=!bingo.vote.cross] remove bingo.vote.line
tag @a[scores={bingo.vote.cross=1..},tag=!bingo.vote.cross] remove bingo.vote.full_house
tag @a[scores={bingo.vote.cross=1..},tag=!bingo.vote.cross] add bingo.vote.cross
scoreboard players reset @a[scores={bingo.vote.cross=1},tag=bingo.vote.cross] bingo.vote.cross
#full_house
scoreboard players enable @a bingo.vote.full_house
execute as @a[scores={bingo.vote.full_house=1..}] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={bingo.vote.full_house=1..},tag=!bingo.vote.full_house] at @s run scoreboard players add vote.full_house bingo.vote.type 1
execute as @a[scores={bingo.vote.full_house=1..},tag=bingo.vote.line] at @s run scoreboard players remove vote.line bingo.vote.type 1
execute as @a[scores={bingo.vote.full_house=1..},tag=bingo.vote.cross] at @s run scoreboard players remove vote.cross bingo.vote.type 1
tag @a[scores={bingo.vote.full_house=1..},tag=!bingo.vote.full_houses] remove bingo.vote.line
tag @a[scores={bingo.vote.full_house=1..},tag=!bingo.vote.full_house] remove bingo.vote.cross
tag @a[scores={bingo.vote.full_house=1..},tag=!bingo.vote.full_house] add bingo.vote.full_house
scoreboard players reset @a[scores={bingo.vote.full_house=1},tag=bingo.vote.full_house] bingo.vote.full_house