execute as @a[tag=bingo.game.player] at @s run function koncept.bingo:bingo/bossbar/visible_false/start
function koncept.bingo:bingo/timer/reset
function koncept.bingo:bingo/start/restart
function koncept.bingo:bingo/win/restart/restart
function koncept.bingo:bingo/win/restart/restart_time
function koncept.bingo:bingo/win/restart/restart_time1
scoreboard players reset @a bingo.reset
scoreboard players enable @a bingo.reset
tellraw @a [{"text":"Bingo game reset.","color":"#54beea"}]
