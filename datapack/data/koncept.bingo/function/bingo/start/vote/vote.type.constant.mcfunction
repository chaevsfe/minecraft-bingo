# Project created by the koncept

scoreboard objectives add bingo.vote.type.win dummy

scoreboard players set win bingo.vote.type.win 0

execute if score vote.line bingo.vote.type > vote.cross bingo.vote.type run execute if score vote.line bingo.vote.type > vote.full_house bingo.vote.type run scoreboard players set win bingo.vote.type.win 1
execute if score vote.cross bingo.vote.type > vote.line bingo.vote.type run execute if score vote.cross bingo.vote.type > vote.full_house bingo.vote.type run scoreboard players set win bingo.vote.type.win 2
execute if score vote.full_house bingo.vote.type > vote.line bingo.vote.type run execute if score vote.full_house bingo.vote.type > vote.cross bingo.vote.type run scoreboard players set win bingo.vote.type.win 3

execute if score vote.full_house bingo.vote.type = vote.line bingo.vote.type run execute if score vote.full_house bingo.vote.type = vote.cross bingo.vote.type run scoreboard players set win bingo.vote.type.win 1

execute if score win bingo.vote.type.win matches 0 run scoreboard players set win bingo.vote.type.win 1

scoreboard objectives remove bingo.vote.type

tag @a remove bingo.vote.line
tag @a remove bingo.vote.cross
tag @a remove bingo.vote.full_house
