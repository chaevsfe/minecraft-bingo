# Project created by the koncept

execute if score win bingo.vote.type.win matches 1 run function koncept.bingo:bingo/win/macro/line/start with storage bingo_list_player_win:data
execute if score win bingo.vote.type.win matches 2 run function koncept.bingo:bingo/win/macro/cross/start with storage bingo_list_player_win:data
execute if score win bingo.vote.type.win matches 3 run function koncept.bingo:bingo/win/macro/full_house/start with storage bingo_list_player_win:data