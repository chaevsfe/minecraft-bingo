# Project created by the koncept

scoreboard players add @s bingo.destroy 1


execute at @s[scores={bingo.destroy=10}] run tag @a[tag=bingo.game.player,tag=!bingo.game.player.training.start] add bingo.game.player.training.start

execute as @s[scores={bingo.destroy=10..}] at @s run time set day


execute as @s[scores={bingo.destroy=10..}] at @s run fill ~5 ~5 ~5 ~-5 ~-5 ~-5 minecraft:air replace #minecraft:glass_blocks

execute as @s[scores={bingo.destroy=10}] at @s run playsound minecraft:block.note_block.bell master @a[tag=bingo.game.player,distance=..4] ~ ~ ~ 999999999999999999 0.63

execute as @s[scores={bingo.destroy=10..}] at @s run gamemode survival @a[tag=bingo.game.player,distance=..10]

execute as @s[scores={bingo.destroy=10..}] at @s run gamerule fall_damage false

execute as @s[scores={bingo.destroy=10}] at @s run effect give @a[distance=..10] minecraft:saturation 1 55 true

execute as @s[scores={bingo.destroy=10}] at @s run title @a[tag=bingo.game.player,distance=..10] title {"translate":"bingo.title","color":"gold"}
execute as @s[scores={bingo.destroy=50}] at @s run execute if score win bingo.vote.type.win matches 1 run function koncept.bingo:bingo/animation_collecte/start_line
execute as @s[scores={bingo.destroy=50}] at @s run execute if score win bingo.vote.type.win matches 2 run function koncept.bingo:bingo/animation_collecte/start_cross

# Give a chance to quit the game
execute as @s[scores={bingo.destroy=10}] at @s run scoreboard objectives add bingo.leave.game.yes trigger
execute as @s[scores={bingo.destroy=10}] at @s run scoreboard objectives add .bingo.leave.game trigger
# Allow you to use the settings
execute as @s[scores={bingo.destroy=10}] at @s run scoreboard objectives add .bingo.settings trigger
execute at @s[scores={bingo.destroy=10}] as @s run scoreboard players reset @a .bingo.settings

execute at @s[scores={bingo.destroy=60..}] as @s run gamerule fall_damage true
execute at @s[scores={bingo.destroy=60..}] as @s run scoreboard objectives add bingo.timer.game dummy
execute at @s[scores={bingo.destroy=60..}] as @s run scoreboard players set start bingo.timer.game 1
execute at @s[scores={bingo.destroy=60..}] as @s run tag @a[tag=bingo.game.player] add bingo.game.visibility

kill @e[scores={bingo.destroy=60..}]