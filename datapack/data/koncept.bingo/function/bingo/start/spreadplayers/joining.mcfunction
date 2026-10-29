# Project created by the koncept

$tag @s add bingo.tpr.$(x)
gamemode adventure @s
clear @s
effect give @s minecraft:saturation 1 55 true

$execute as @a[team=$(x).bingo,tag=!bingo.instant.destroy] at @s run spreadplayers ~ ~ 0 10 false @a[team=$(x).bingo,tag=bingo.instant.destroy]
execute as @s at @s align xyz run tp @s ~ ~15 ~
execute as @s at @s align xyz run tp @s ~0.5 ~ ~0.5
execute as @s at @s align xyz run setblock ~ ~-1 ~ minecraft:glass
execute as @s at @s align xyz run spawnpoint @s ~ ~-15 ~

execute as @s at @s run function koncept.bingo:bingo/start/spreadplayers/bottle/1 with storage minecraft:bingo.macro.destroy input
execute as @s at @s run summon minecraft:marker ~ ~-1 ~ {Tags:["bingo.destroy","bingo.destroy.start"]}
scoreboard objectives add bingo.destroy dummy
$tag @a[tag=bingo.tpr.$(x)] remove bingo.tpr.$(x)

tag @s[tag=bingo.instant.destroy] remove bingo.instant.destroy