# Project created by the koncept

# number
execute as @a[tag=!bingo.have.id.player] at @s run function koncept.bingo:bingo/bossbar/add/number

scoreboard players enable @a bingo.team.join.red
execute as @a[scores={bingo.team.join.red=1}] at @s run function koncept.bingo:bingo/start/team_join/red
scoreboard players enable @a bingo.team.join.dark_red
execute as @a[scores={bingo.team.join.dark_red=1}] at @s run function koncept.bingo:bingo/start/team_join/dark_red
scoreboard players enable @a bingo.team.join.yellow
execute as @a[scores={bingo.team.join.yellow=1}] at @s run function koncept.bingo:bingo/start/team_join/yellow
scoreboard players enable @a bingo.team.join.gold
execute as @a[scores={bingo.team.join.gold=1}] at @s run function koncept.bingo:bingo/start/team_join/gold
scoreboard players enable @a bingo.team.join.white
execute as @a[scores={bingo.team.join.white=1}] at @s run function koncept.bingo:bingo/start/team_join/white
scoreboard players enable @a bingo.team.join.aqua
execute as @a[scores={bingo.team.join.aqua=1}] at @s run function koncept.bingo:bingo/start/team_join/aqua
scoreboard players enable @a bingo.team.join.green
execute as @a[scores={bingo.team.join.green=1}] at @s run function koncept.bingo:bingo/start/team_join/green
scoreboard players enable @a bingo.team.join.blue
execute as @a[scores={bingo.team.join.blue=1}] at @s run function koncept.bingo:bingo/start/team_join/blue
scoreboard players enable @a bingo.team.join.light_purple
execute as @a[scores={bingo.team.join.light_purple=1}] at @s run function koncept.bingo:bingo/start/team_join/light_purple

execute if score timer bingo.start.game.timer matches 1.. run scoreboard players add timer bingo.start.game.timer 1

execute unless score mod bingo.companion matches 1 if score timer bingo.start.game.timer matches 1..300 run title @a[tag=bingo.game.player] actionbar [{"translate":"bingo.status.players","color":"#ffcc64"},{"text":" "},{"score":{"name":"count","objective":"count_player_bingo"},"color":"#FFE254"}]

execute unless score mod bingo.companion matches 1 if score timer bingo.start.game.timer matches 300..600 run title @a[tag=bingo.game.player] actionbar [{"translate":"bingo.status.players","color":"#ffcc64"},{"text":" "},{"score":{"name":"count","objective":"count_player_bingo"},"color":"#FFE254"},{"text":" line: "},{"score":{"name":"vote.line","objective":"bingo.vote.type"},"color":"#FFE254"},{"text":" cross: "},{"score":{"name":"vote.cross","objective":"bingo.vote.type"},"color":"#FFE254"},{"text":" full house: "},{"score":{"name":"vote.full_house","objective":"bingo.vote.type"},"color":"#FFE254"}]

execute unless score mod bingo.companion matches 1 if score timer bingo.start.game.timer matches 600..900 run title @a[tag=bingo.game.player] actionbar [{"translate":"bingo.status.players","color":"#ffcc64"},{"text":" "},{"score":{"name":"count","objective":"count_player_bingo"},"color":"#FFE254"},{"text":" standard: "},{"score":{"name":"vote.standart","objective":"bingo.vote.difficulty"},"color":"#FFE254"},{"text":" difficult: "},{"score":{"name":"vote.difficult","objective":"bingo.vote.difficulty"},"color":"#FFE254"},{"text":" hardcore: "},{"score":{"name":"vote.hardcore","objective":"bingo.vote.difficulty"},"color":"#FFE254"}]
execute if score mod bingo.companion matches 1 if score timer bingo.start.game.timer matches 1..909 run title @a[tag=bingo.game.player] actionbar [{"translate":"bingo.status.players","color":"#ffcc64"},{"text":" "},{"score":{"name":"count","objective":"count_player_bingo"},"color":"#FFE254"},{"text":"  Lobby closes in ","color":"#ffcc64"},{"score":{"name":"seconds","objective":"bingo.companion"},"color":"#FFE254"},{"text":"s","color":"#ffcc64"}]


execute if score timer bingo.start.game.timer matches 900 run execute unless entity @a[tag=bingo.game.player] run function koncept.bingo:bingo/win/restart

execute if score start bingo.vote.type matches 1.. run function koncept.bingo:bingo/start/vote/vote.type

execute if score start bingo.vote.difficulty matches 1.. run function koncept.bingo:bingo/start/vote/vote.difficulty

execute if score timer bingo.start.game.timer matches 900 run function koncept.bingo:bingo/start/vote/vote.type.constant
execute if score timer bingo.start.game.timer matches 900 run function koncept.bingo:bingo/start/vote/vote.difficulty.constant


execute unless score mod bingo.companion matches 1 if score timer bingo.start.game.timer matches 300 run function koncept.bingo:bingo/start/vote/vote.type.start
execute if score timer bingo.start.game.timer matches 2 if score mod bingo.companion matches 1 run function koncept.bingo:bingo/start/vote/vote.type.start
execute unless score mod bingo.companion matches 1 if score timer bingo.start.game.timer matches 600 run function koncept.bingo:bingo/start/vote/vote.difficulty.start
execute if score timer bingo.start.game.timer matches 2 if score mod bingo.companion matches 1 run function koncept.bingo:bingo/start/vote/vote.difficulty.start

# Completing this phase of the transition to randomization of objects
execute if score timer bingo.start.game.timer matches 910.. run function koncept.bingo:bingo/start/sequence/5_end
