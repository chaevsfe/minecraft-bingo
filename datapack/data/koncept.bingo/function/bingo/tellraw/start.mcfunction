# Project created by the koncept

scoreboard players enable @s bingo.name.check.list.object_1
scoreboard players enable @s bingo.name.check.list.object_2
scoreboard players enable @s bingo.name.check.list.object_3
scoreboard players enable @s bingo.name.check.list.object_4
scoreboard players enable @s bingo.name.check.list.object_5
scoreboard players enable @s bingo.name.check.list.object_6
scoreboard players enable @s bingo.name.check.list.object_7
scoreboard players enable @s bingo.name.check.list.object_8
scoreboard players enable @s bingo.name.check.list.object_9
scoreboard players enable @s bingo.name.check.list.object_10
scoreboard players enable @s bingo.name.check.list.object_11
scoreboard players enable @s bingo.name.check.list.object_12
scoreboard players enable @s bingo.name.check.list.object_13
scoreboard players enable @s bingo.name.check.list.object_14
scoreboard players enable @s bingo.name.check.list.object_15
scoreboard players enable @s bingo.name.check.list.object_16
scoreboard players enable @s bingo.name.check.list.object_17
scoreboard players enable @s bingo.name.check.list.object_18
scoreboard players enable @s bingo.name.check.list.object_19
scoreboard players enable @s bingo.name.check.list.object_20
scoreboard players enable @s bingo.name.check.list.object_21
scoreboard players enable @s bingo.name.check.list.object_22
scoreboard players enable @s bingo.name.check.list.object_23
scoreboard players enable @s bingo.name.check.list.object_24
scoreboard players enable @s bingo.name.check.list.object_25

execute store result storage bingo.macro space int 1 run scoreboard players get @s bingo.space

execute store result storage bingo.macro number_id_player int 1 run scoreboard players get @s bingo.number.id.player

execute as @s[tag=bingo.actionbar.bottom] at @s run data modify storage minecraft:bingo.macro top_or_bottom set value bottom
execute as @s[tag=bingo.actionbar.top] at @s run data modify storage minecraft:bingo.macro top_or_bottom set value top

execute as @s[tag=bingo.actionbar.bottom,scores={bottom.gui.Scale=1}] at @s run data modify storage minecraft:bingo.macro height set value "top"
execute as @s[tag=bingo.actionbar.bottom,scores={bottom.gui.Scale=2}] at @s run data modify storage minecraft:bingo.macro height set value "top"
execute as @s[tag=bingo.actionbar.bottom,scores={bottom.gui.Scale=3}] at @s run data modify storage minecraft:bingo.macro height set value "top"
execute as @s[tag=bingo.actionbar.bottom,scores={bottom.gui.Scale=4}] at @s run data modify storage minecraft:bingo.macro height set value "top"
execute as @s[tag=bingo.actionbar.bottom,scores={bottom.gui.Scale=5}] at @s run data modify storage minecraft:bingo.macro height set value "top"
execute as @s[tag=bingo.actionbar.bottom,scores={bottom.gui.Scale=6}] at @s run data modify storage minecraft:bingo.macro height set value "top"
execute as @s[tag=bingo.actionbar.top] at @s run data modify storage minecraft:bingo.macro height set value "top"

execute as @s[team=gold.bingo] at @s run function koncept.bingo:bingo/tellraw/file_selection/gold with storage minecraft:bingo.macro
execute as @s[team=green.bingo] at @s run function koncept.bingo:bingo/tellraw/file_selection/green with storage minecraft:bingo.macro
execute as @s[team=aqua.bingo] at @s run function koncept.bingo:bingo/tellraw/file_selection/aqua with storage minecraft:bingo.macro
execute as @s[team=blue.bingo] at @s run function koncept.bingo:bingo/tellraw/file_selection/blue with storage minecraft:bingo.macro
execute as @s[team=dark_red.bingo] at @s run function koncept.bingo:bingo/tellraw/file_selection/dark_red with storage minecraft:bingo.macro
execute as @s[team=light_purple.bingo] at @s run function koncept.bingo:bingo/tellraw/file_selection/light_purple with storage minecraft:bingo.macro
execute as @s[team=red.bingo] at @s run function koncept.bingo:bingo/tellraw/file_selection/red with storage minecraft:bingo.macro
execute as @s[team=white.bingo] at @s run function koncept.bingo:bingo/tellraw/file_selection/white with storage minecraft:bingo.macro
execute as @s[team=yellow.bingo] at @s run function koncept.bingo:bingo/tellraw/file_selection/yellow with storage minecraft:bingo.macro