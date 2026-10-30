# Project created by the koncept

scoreboard objectives remove bingo.team.have
scoreboard objectives add bingo.team.have dummy

scoreboard players set green bingo.team.have 0
scoreboard players set light_purple bingo.team.have 0
scoreboard players set red bingo.team.have 0
scoreboard players set white bingo.team.have 0
scoreboard players set yellow bingo.team.have 0
scoreboard players set aqua bingo.team.have 0
scoreboard players set blue bingo.team.have 0
scoreboard players set dark_red bingo.team.have 0
scoreboard players set gold bingo.team.have 0

execute as @a[team=green.bingo] run scoreboard players add green bingo.team.have 1
execute as @a[team=light_purple.bingo] run scoreboard players add light_purple bingo.team.have 1
execute as @a[team=red.bingo] run scoreboard players add red bingo.team.have 1
execute as @a[team=white.bingo] run scoreboard players add white bingo.team.have 1
execute as @a[team=yellow.bingo] run scoreboard players add yellow bingo.team.have 1
execute as @a[team=aqua.bingo] run scoreboard players add aqua bingo.team.have 1
execute as @a[team=blue.bingo] run scoreboard players add blue bingo.team.have 1
execute as @a[team=dark_red.bingo] run scoreboard players add dark_red bingo.team.have 1
execute as @a[team=gold.bingo] run scoreboard players add gold bingo.team.have 1

# Displaying the unicode of the game type
execute if score win bingo.vote.type.win matches 1 run data modify storage bingo.macro game_difficulty set value "\\u0001"
execute if score win bingo.vote.type.win matches 2 run data modify storage bingo.macro game_difficulty set value "\\u0002"
execute if score win bingo.vote.type.win matches 3 run data modify storage bingo.macro game_difficulty set value "\\u0003"

# If the player has never adjusted the display of the list, set the optimal value
execute as @a[tag=bingo.game.player,tag=!bingo.actionbar.start] run function koncept.bingo:bingo/bossbar/add/start
execute as @a[tag=bingo.game.player,tag=!bingo.actionbar.start] unless score @s bingo.icon.size = @s bingo.icon.size run scoreboard players set @s bingo.icon.size 16
execute as @a[tag=bingo.game.player,tag=!bingo.actionbar.start] unless score @s bingo.timer.game.settings = @s bingo.timer.game.settings run scoreboard players set @s bingo.timer.game.settings 1
scoreboard players set @a[tag=bingo.game.player,tag=!bingo.actionbar.start] bottom.gui.Scale 1
tag @a[tag=bingo.game.player,tag=!bingo.actionbar.start] add bingo.actionbar.top
execute as @a[tag=bingo.game.player,tag=!bingo.actionbar.start] unless score @s bingo.space = @s bingo.space run scoreboard players set @s bingo.space 0
execute as @a[tag=bingo.game.player,tag=!bingo.actionbar.start] unless score @s bingo.vertical = @s bingo.vertical run scoreboard players set @s bingo.vertical 0
tag @a[tag=bingo.game.player,tag=!bingo.actionbar.start] add bingo.actionbar.left
tag @a[tag=bingo.game.player,tag=!bingo.actionbar.start] add bingo.actionbar.start

# Updating all components to basic values / restart
function koncept.bingo:bingo/start/restart/restart

# After restarting, run
execute unless score count count_player_bingo matches 0 run function koncept.bingo:bingo/start/generate_random_object

execute if score count count_player_bingo matches 0 run function koncept.bingo:bingo/start/restart