# Project created by the koncept

fill ~ ~ ~ ~ ~1 ~ air

$execute as @a[tag=bingo.tpr.$(x)] at @s run fill ~1 ~ ~ ~1 ~1 ~ minecraft:$(y)_stained_glass

$execute as @a[tag=bingo.tpr.$(x)] at @s run fill ~-1 ~ ~ ~-1 ~1 ~ minecraft:$(y)_stained_glass

$execute as @a[tag=bingo.tpr.$(x)] at @s run fill ~ ~ ~1 ~ ~1 ~1 minecraft:$(y)_stained_glass

$execute as @a[tag=bingo.tpr.$(x)] at @s run fill ~ ~ ~-1 ~ ~1 ~-1 minecraft:$(y)_stained_glass

$execute as @a[tag=bingo.tpr.$(x)] at @s run setblock ~ ~2 ~ minecraft:$(y)_stained_glass

$execute as @a[tag=bingo.tpr.$(x)] at @s run setblock ~ ~-1 ~ minecraft:$(y)_stained_glass