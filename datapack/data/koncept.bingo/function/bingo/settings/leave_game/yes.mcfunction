# Project created by the koncept

playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

tellraw @s [{"translate":"bingo.quit.success","color":"red"}]

execute as @s at @s run function koncept.bingo:bingo/settings/leave_game/start_message

execute as @s at @s run function koncept.bingo:bingo/bossbar/visible_false/start

tag @s remove bingo.game.visibility

team leave @s
tag @s remove bingo.game.player
tag @s remove bingo.starter_game

scoreboard players remove count count_player_bingo 1

scoreboard players reset @s bingo.leave.game.yes

execute if score count count_player_bingo matches 0 run scoreboard players set start bingo.start.launch.receipt 0
execute if score count count_player_bingo matches 0 run function koncept.bingo:bingo/start/restart