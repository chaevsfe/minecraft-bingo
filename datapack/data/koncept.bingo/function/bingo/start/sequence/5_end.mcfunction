# Project created by the koncept

scoreboard objectives remove bingo.leave.game
scoreboard objectives add bingo.leave.game minecraft.custom:minecraft.leave_game

execute if score dynamic.lock bingo.dynamic.advancement matches 1 run function koncept.bingo:bingo/dynamic_advancement/advancement/enabled
execute if score dynamic.lock bingo.dynamic.advancement matches -1 run function koncept.bingo:bingo/dynamic_advancement/advancement/disabled

scoreboard players reset start bingo.start.enable.trigger

scoreboard objectives remove bingo.count.object
scoreboard objectives add bingo.count.object dummy

scoreboard objectives remove bingo.vote.type

scoreboard objectives add bingo.win.restart dummy

scoreboard objectives remove bingo.team.have

scoreboard objectives remove bingo.startYes
scoreboard objectives add bingo.startYes trigger

scoreboard objectives remove bingo.team.join.red
scoreboard objectives remove bingo.team.join.dark_red
scoreboard objectives remove bingo.team.join.yellow
scoreboard objectives remove bingo.team.join.gold
scoreboard objectives remove bingo.team.join.white
scoreboard objectives remove bingo.team.join.aqua
scoreboard objectives remove bingo.team.join.green
scoreboard objectives remove bingo.team.join.blue
scoreboard objectives remove bingo.team.join.light_purple

scoreboard objectives add bingo.team.join.red trigger
scoreboard objectives add bingo.team.join.dark_red trigger
scoreboard objectives add bingo.team.join.yellow trigger
scoreboard objectives add bingo.team.join.gold trigger
scoreboard objectives add bingo.team.join.white trigger
scoreboard objectives add bingo.team.join.aqua trigger
scoreboard objectives add bingo.team.join.green trigger
scoreboard objectives add bingo.team.join.blue trigger
scoreboard objectives add bingo.team.join.light_purple trigger

scoreboard objectives remove bingo.vote.line
scoreboard objectives remove bingo.vote.cross
scoreboard objectives remove bingo.vote.full_house
scoreboard objectives remove bingo.vote.standart
scoreboard objectives remove bingo.vote.difficult
scoreboard objectives remove bingo.vote.hardcore

scoreboard objectives add bingo.vote.line trigger
scoreboard objectives add bingo.vote.cross trigger
scoreboard objectives add bingo.vote.full_house trigger
scoreboard objectives add bingo.vote.standart trigger
scoreboard objectives add bingo.vote.difficult trigger
scoreboard objectives add bingo.vote.hardcore trigger

scoreboard objectives remove bingo.start.game.timer
scoreboard objectives add bingo.start.game.timer trigger

# The player started the game himself does not participate in the game and no one joined his game
tag @a[tag=bingo.starter_game,tag=!bingo.game.player] remove bingo.starter_game
execute if score count count_player_bingo matches 0 run scoreboard players set start bingo.start.launch.receipt 0
execute if score count count_player_bingo matches 0 run return run function koncept.bingo:bingo/start/restart

function koncept.bingo:bingo/start/sequence/6

function koncept.bingo:bingo/start/spreadplayers/start_macro
