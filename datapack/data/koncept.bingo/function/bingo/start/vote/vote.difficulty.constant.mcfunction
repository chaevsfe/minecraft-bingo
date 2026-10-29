# Project created by the koncept

scoreboard objectives add bingo.vote.difficulty.win dummy

scoreboard players set win bingo.vote.difficulty.win 0

execute if score vote.standart bingo.vote.difficulty > vote.difficult bingo.vote.difficulty run execute if score vote.standart bingo.vote.difficulty > vote.hardcore bingo.vote.difficulty run scoreboard players set win bingo.vote.difficulty.win 1
execute if score vote.difficult bingo.vote.difficulty > vote.standart bingo.vote.difficulty run execute if score vote.difficult bingo.vote.difficulty > vote.hardcore bingo.vote.difficulty run scoreboard players set win bingo.vote.difficulty.win 2
execute if score vote.hardcore bingo.vote.difficulty > vote.standart bingo.vote.difficulty run execute if score vote.hardcore bingo.vote.difficulty > vote.difficult bingo.vote.difficulty run scoreboard players set win bingo.vote.difficulty.win 3

execute if score vote.hardcore bingo.vote.difficulty = vote.standart bingo.vote.difficulty run execute if score vote.hardcore bingo.vote.difficulty = vote.difficult bingo.vote.difficulty run scoreboard players set win bingo.vote.difficulty.win 1

execute if score win bingo.vote.difficulty.win matches 0 run scoreboard players set win bingo.vote.difficulty.win 1

scoreboard objectives remove bingo.vote.difficulty

tag @a remove bingo.vote.standart
tag @a remove bingo.vote.difficult
tag @a remove bingo.vote.hardcore

