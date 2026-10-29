# Project created by the koncept

gamerule locator_bar true

function koncept.bingo:bingo/dynamic_advancement/advancement/enabled

scoreboard objectives remove bingo.count.object

scoreboard objectives add bingo.count.object dummy

scoreboard players reset @a bingo.start

scoreboard objectives remove count_player_bingo

tag @a remove bingo.starter_game

scoreboard players reset start bingo.start.spawn.item

scoreboard objectives remove bingo.vote.type

scoreboard objectives remove bingo.vote.difficulty

tag @a remove bingo.vote.line
tag @a remove bingo.vote.cross
tag @a remove bingo.vote.full_house
tag @a remove bingo.vote.standart
tag @a remove bingo.vote.difficult
tag @a remove bingo.vote.hardcore

scoreboard objectives add bingo.win.restart dummy

scoreboard players set bingo.win.restart bingo.win.restart 1
