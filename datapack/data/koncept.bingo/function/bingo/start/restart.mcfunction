# Project created by the koncept

function koncept.bingo:bingo/dynamic_advancement/advancement/enabled

gamerule locator_bar true

function koncept.bingo:bingo/timer/reset

function koncept.bingo:bingo/start/restart/restart

scoreboard objectives remove bingo.vote.type

scoreboard objectives remove bingo.vote.difficulty

tag @a remove bingo.vote.line
tag @a remove bingo.vote.cross
tag @a remove bingo.vote.full_house
tag @a remove bingo.vote.standart
tag @a remove bingo.vote.difficult
tag @a remove bingo.vote.hardcore

scoreboard objectives remove count_player_bingo

scoreboard objectives add count_player_bingo dummy

scoreboard players reset start bingo.start.spawn.item

tag @a remove bingo.starter_game

tag @a remove bingo.game.player

team leave @a

scoreboard objectives remove bingo.team.have

scoreboard players reset start bingo.start.enable.trigger

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

scoreboard objectives remove bingo.start.game.timer

scoreboard objectives add bingo.start.game.timer trigger