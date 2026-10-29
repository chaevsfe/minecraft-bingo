# Project created by the koncept

# Which team won
$tag @a[team=$(team_color).bingo] add bingo.check.max
function koncept.bingo:bingo/win/max/start
function koncept.bingo:bingo/win/max/end with storage bingo_list_player_win:data

scoreboard objectives remove bingo.count.object

# Game time
execute if score m bingo.timer.game matches 0 if score h bingo.timer.game matches 0 run tellraw @a[tag=bingo.game.player] [{"translate":"bingo.timer.value","color":"#ffcc64"},{"score":{"name":"s","objective":"bingo.timer.game"},"color":"#FFE254"}]

execute if score m bingo.timer.game matches 1.. if score h bingo.timer.game matches 0 run tellraw @a[tag=bingo.game.player] [{"translate":"bingo.timer.value","color":"#ffcc64"},{"score":{"name":"m","objective":"bingo.timer.game"},"color":"#FFE254"},{"text":":","color":"#FFE254"},{"score":{"name":"s","objective":"bingo.timer.game"},"color":"#FFE254"}]

execute if score h bingo.timer.game matches 1.. run tellraw @a[tag=bingo.game.player] [{"translate":"bingo.timer.value","color":"#ffcc64"},{"score":{"name":"h","objective":"bingo.timer.game"},"color":"#FFE254"},{"text":":","color":"#FFE254"},{"score":{"name":"m","objective":"bingo.timer.game"},"color":"#FFE254"},{"text":":","color":"#FFE254"},{"score":{"name":"s","objective":"bingo.timer.game"},"color":"#FFE254"}]

# That you can't win anymore.
scoreboard players set win bingo.vote.type.win 0

function koncept.bingo:bingo/timer/reset

tag @a[tag=bingo.game.player] remove bingo.game.visibility

team leave @a[tag=bingo.game.player]
$team join $(team_color).bingo @a[tag=bingo.game.player]

execute as @a[tag=bingo.game.player] at @s run function koncept.bingo:bingo/bossbar/start
execute as @a[tag=bingo.game.player] at @s run function koncept.bingo:bingo/bossbar/visible_false/start1

function koncept.bingo:bingo/win/restart/restart