# Project created by the koncept

$gamemode adventure @a[team=$(x).bingo]

$clear @a[team=$(x).bingo]

$effect give @a[team=$(x).bingo] minecraft:saturation 1 55 true

$execute as @r[team=$(x).bingo] at @s run tag @s add bingo.tpr.$(x)

$execute if score tp bingo.type.tp matches 1 run execute as @a[tag=bingo.tpr.$(x)] at @s run spreadplayers ~ ~ 0 1000 false @s

$execute as @a[tag=bingo.tpr.$(x)] at @s run spreadplayers ~ ~ 0 10 false @s

$execute as @a[tag=bingo.tpr.$(x)] at @s run tp @s ~ ~15 ~

$execute as @a[tag=bingo.tpr.$(x)] at @s align xyz run tp @s ~0.5 ~ ~0.5

$tp @a[team=$(x).bingo] @a[tag=bingo.tpr.$(x),sort=nearest,limit=1]

$execute as @a[tag=bingo.tpr.$(x)] at @s run setblock ~ ~-1 ~ minecraft:glass

$execute as @a[tag=bingo.tpr.$(x)] at @s if score $(x) bingo.team.have matches 2.. run function koncept.bingo:bingo/start/spreadplayers/bottle/2 with storage minecraft:bingo.macro.destroy input

$execute as @a[tag=bingo.tpr.$(x)] at @s if score $(x) bingo.team.have matches 1 run function koncept.bingo:bingo/start/spreadplayers/bottle/1 with storage minecraft:bingo.macro.destroy input

scoreboard objectives add bingo.destroy dummy

$execute as @a[tag=bingo.tpr.$(x)] at @s run spawnpoint @a[team=$(x).bingo] ~ ~-15 ~
$execute as @a[tag=bingo.tpr.$(x),tag=!bingo.instant.destroy] at @s run summon minecraft:marker ~ ~-1 ~ {Tags:["bingo.destroy"]}
$execute as @a[tag=bingo.tpr.$(x),tag=bingo.instant.destroy] at @s run summon minecraft:marker ~ ~-1 ~ {Tags:["bingo.destroy","bingo.destroy.start"]}

$tag @a[tag=bingo.tpr.$(x)] remove bingo.tpr.$(x)
tag @a[tag=bingo.instant.destroy] remove bingo.instant.destroy
