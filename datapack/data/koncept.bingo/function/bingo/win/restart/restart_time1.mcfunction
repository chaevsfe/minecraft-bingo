# Project created by the koncept

scoreboard objectives remove stop_win_bingo

function koncept.bingo:bingo/start/restart/restart

execute if score mod bingo.companion matches 1 run advancement revoke @a everything

scoreboard players set start bingo.start.launch.receipt 0

execute as @a[tag=bingo.game.player] at @s run function koncept.bingo:bingo/bossbar/visible_false/start

team leave @a[tag=bingo.game.player]

scoreboard objectives remove bingo.win.restart

tag @a remove bingo.game.player

tag @a remove tel.bingo1
