# Project created by the koncept

# Dynamic Advancement
execute as @a[tag=bingo.advancement.disabled] if score dynamic bingo.dynamic.advancement matches 1 at @s run function koncept.bingo:advancement/enabled

# The game has started
execute if score start bingo.start.launch.receipt matches 1 run function koncept.bingo:bingo/main/main

###### /trigger

### Rules
scoreboard players enable @a .bingo.rules
scoreboard players enable @a bingo.reset
execute as @a[scores={bingo.reset=1..}] run function koncept.bingo:reset
execute as @a[scores={.bingo.rules=1..}] at @s run function koncept.bingo:bingo/settings/rules

### Start game
scoreboard players enable @a .bingo.start
execute as @a[scores={.bingo.start=1..}] at @s run function koncept.bingo:bingo/start/sequence/1

execute as @a[scores={bingo.tp_yes=1..}] at @s run function koncept.bingo:bingo/start/sequence/tp_yes
execute as @a[scores={bingo.tp_no=1..}] at @s run function koncept.bingo:bingo/start/sequence/tp_no

execute as @a[scores={bingo.dynamic.advancement.enabled=1..}] at @s run function koncept.bingo:bingo/start/sequence/advancement.enabled
execute as @a[scores={bingo.dynamic.advancement.disabled=1..}] at @s run function koncept.bingo:bingo/start/sequence/advancement.disabled

execute as @a[scores={bingo.dynamic.locator.bar.enabled=1..}] at @s run function koncept.bingo:bingo/start/sequence/locator.bar.enabled
execute as @a[scores={bingo.dynamic.locator.bar.disabled=1..}] at @s run function koncept.bingo:bingo/start/sequence/locator.bar.disabled

# Joining the game
execute as @a[scores={bingo.startYes=1}] at @s run function koncept.bingo:bingo/start/sequence/message/bingo.startyes
execute as @a[scores={bingo.started_game=1..}] at @s run function koncept.bingo:bingo/start/bingo.startyes