# Project created by the koncept
execute if score @s bingo.leave.game matches 1.. run function koncept.bingo:bingo/main/re-enter

### Сrossbow_firework
execute if score crossbow_firework bingo.restart.replay matches 1 run function koncept.bingo:bingo/main/crossbow_firework

### Crossbow_arrow tipped_arrow
execute if score crossbow_arrow bingo.restart.replay matches 1 run function koncept.bingo:bingo/main/crossbow_arrow

### Leave game
scoreboard players enable @s .bingo.leave.game
execute as @s[scores={.bingo.leave.game=1..}] at @s run function koncept.bingo:bingo/settings/leave_game/ask
# Confirmation of logout
execute as @s[scores={bingo.leave.game.yes=1..}] at @s run function koncept.bingo:bingo/settings/leave_game/yes

### Settings
scoreboard players enable @s .bingo.settings
execute as @s[scores={.bingo.settings=1..}] at @s run function koncept.bingo:bingo/settings/start_trigger

execute as @s[scores={bingo.settings.icon.size_1=1..}] at @s run function koncept.bingo:bingo/settings/icon_size/1
execute as @s[scores={bingo.settings.icon.size_2=1..}] at @s run function koncept.bingo:bingo/settings/icon_size/2

execute as @s[scores={bingo.timer.game.yes=1..}] at @s run function koncept.bingo:bingo/settings/timer/yes
execute as @s[scores={bingo.timer.game.no=1..}] at @s run function koncept.bingo:bingo/settings/timer/no

execute as @s[scores={bingo.adjustment_1=1..}] at @s run function koncept.bingo:bingo/settings/space/1
execute as @s[scores={bingo.adjustment_2=1..}] at @s run function koncept.bingo:bingo/settings/space/2
execute as @s[scores={bingo.adjustment_3=1..}] at @s run function koncept.bingo:bingo/settings/space/3
execute as @s[scores={bingo.adjustment_4=1..}] at @s run function koncept.bingo:bingo/settings/space/4
execute as @s[scores={bingo.adjustment_5=1..}] at @s run function koncept.bingo:bingo/settings/space/5
execute as @s[scores={bingo.adjustment_6=1..}] at @s run function koncept.bingo:bingo/settings/space/6

execute as @s[scores={bingo.items_bottom_1=1..}] at @s run function koncept.bingo:bingo/settings/bottom/1
execute as @s[scores={bingo.items_bottom_2=1..}] at @s run function koncept.bingo:bingo/settings/bottom/2
execute as @s[scores={bingo.items_bottom_3=1..}] at @s run function koncept.bingo:bingo/settings/bottom/3
execute as @s[scores={bingo.items_bottom_4=1..}] at @s run function koncept.bingo:bingo/settings/bottom/4
execute as @s[scores={bingo.items_bottom_5=1..}] at @s run function koncept.bingo:bingo/settings/bottom/5
execute as @s[scores={bingo.items_bottom_6=1..}] at @s run function koncept.bingo:bingo/settings/bottom/6

execute as @s[scores={bingo.reset.settings=1..}] at @s run function koncept.bingo:bingo/settings/reset_settings
execute as @s[scores={bingo.items_top=1..}] at @s run function koncept.bingo:bingo/settings/top

### Name check list
execute as @s[scores={bingo.name.check.list.object_start=1..}] at @s run function koncept.bingo:bingo/settings/name_check
# Tellraw
execute as @s[scores={bingo.name.check.list.object_1=1..}] at @s run function koncept.bingo:bingo/tellraw/name/1 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_2=1..}] at @s run function koncept.bingo:bingo/tellraw/name/2 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_3=1..}] at @s run function koncept.bingo:bingo/tellraw/name/3 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_4=1..}] at @s run function koncept.bingo:bingo/tellraw/name/4 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_5=1..}] at @s run function koncept.bingo:bingo/tellraw/name/5 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_6=1..}] at @s run function koncept.bingo:bingo/tellraw/name/6 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_7=1..}] at @s run function koncept.bingo:bingo/tellraw/name/7 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_8=1..}] at @s run function koncept.bingo:bingo/tellraw/name/8 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_9=1..}] at @s run function koncept.bingo:bingo/tellraw/name/9 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_10=1..}] at @s run function koncept.bingo:bingo/tellraw/name/10 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_11=1..}] at @s run function koncept.bingo:bingo/tellraw/name/11 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_12=1..}] at @s run function koncept.bingo:bingo/tellraw/name/12 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_13=1..}] at @s run function koncept.bingo:bingo/tellraw/name/13 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_14=1..}] at @s run function koncept.bingo:bingo/tellraw/name/14 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_15=1..}] at @s run function koncept.bingo:bingo/tellraw/name/15 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_16=1..}] at @s run function koncept.bingo:bingo/tellraw/name/16 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_17=1..}] at @s run function koncept.bingo:bingo/tellraw/name/17 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_18=1..}] at @s run function koncept.bingo:bingo/tellraw/name/18 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_19=1..}] at @s run function koncept.bingo:bingo/tellraw/name/19 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_20=1..}] at @s run function koncept.bingo:bingo/tellraw/name/20 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_21=1..}] at @s run function koncept.bingo:bingo/tellraw/name/21 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_22=1..}] at @s run function koncept.bingo:bingo/tellraw/name/22 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_23=1..}] at @s run function koncept.bingo:bingo/tellraw/name/23 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_24=1..}] at @s run function koncept.bingo:bingo/tellraw/name/24 with storage minecraft:bingo.macro data
execute as @s[scores={bingo.name.check.list.object_25=1..}] at @s run function koncept.bingo:bingo/tellraw/name/25 with storage minecraft:bingo.macro data