# Project created by the koncept
#vote.standart
scoreboard players enable @a bingo.vote.standart
execute as @a[scores={bingo.vote.standart=1..}] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={bingo.vote.standart=1..},tag=!bingo.vote.standart] at @s run scoreboard players add vote.standart bingo.vote.difficulty 1
execute as @a[scores={bingo.vote.standart=1..},tag=bingo.vote.difficult] at @s run scoreboard players remove vote.difficult bingo.vote.difficulty 1
execute as @a[scores={bingo.vote.standart=1..},tag=bingo.vote.hardcore] at @s run scoreboard players remove vote.hardcore bingo.vote.difficulty 1
tag @a[scores={bingo.vote.standart=1..},tag=!bingo.vote.standart] remove bingo.vote.difficult
tag @a[scores={bingo.vote.standart=1..},tag=!bingo.vote.standart] remove bingo.vote.hardcore
tag @a[scores={bingo.vote.standart=1..},tag=!bingo.vote.standart] add bingo.vote.standart
scoreboard players reset @a[scores={bingo.vote.standart=1},tag=bingo.vote.standart] bingo.vote.standart
#vote.difficult
scoreboard players enable @a bingo.vote.difficult
execute as @a[scores={bingo.vote.difficult=1..}] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={bingo.vote.difficult=1..},tag=!bingo.vote.difficult] at @s run scoreboard players add vote.difficult bingo.vote.difficulty 1
execute as @a[scores={bingo.vote.difficult=1..},tag=bingo.vote.standart] at @s run scoreboard players remove vote.standart bingo.vote.difficulty 1
execute as @a[scores={bingo.vote.difficult=1..},tag=bingo.vote.hardcore] at @s run scoreboard players remove vote.hardcore bingo.vote.difficulty 1
tag @a[scores={bingo.vote.difficult=1..},tag=!bingo.vote.difficult] remove bingo.vote.standart
tag @a[scores={bingo.vote.difficult=1..},tag=!bingo.vote.difficult] remove bingo.vote.hardcore
tag @a[scores={bingo.vote.difficult=1..},tag=!bingo.vote.difficult] add bingo.vote.difficult
scoreboard players reset @a[scores={bingo.vote.difficult=1},tag=bingo.vote.difficult] bingo.vote.difficult
#hardcore
scoreboard players enable @a bingo.vote.hardcore
execute as @a[scores={bingo.vote.hardcore=1..}] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
execute as @a[scores={bingo.vote.hardcore=1..},tag=!bingo.vote.hardcore] at @s run scoreboard players add vote.hardcore bingo.vote.difficulty 1
execute as @a[scores={bingo.vote.hardcore=1..},tag=bingo.vote.standart] at @s run scoreboard players remove vote.standart bingo.vote.difficulty 1
execute as @a[scores={bingo.vote.hardcore=1..},tag=bingo.vote.difficult] at @s run scoreboard players remove vote.difficult bingo.vote.difficulty 1
tag @a[scores={bingo.vote.hardcore=1..},tag=!bingo.vote.hardcores] remove bingo.vote.standart
tag @a[scores={bingo.vote.hardcore=1..},tag=!bingo.vote.hardcore] remove bingo.vote.difficult
tag @a[scores={bingo.vote.hardcore=1..},tag=!bingo.vote.hardcore] add bingo.vote.hardcore
scoreboard players reset @a[scores={bingo.vote.hardcore=1},tag=bingo.vote.hardcore] bingo.vote.hardcore