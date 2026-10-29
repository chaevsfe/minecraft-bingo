scoreboard players add count bingo.count.object.check.max.text 1

$data modify storage bingo_list_player_win:data uuid set value '$(UUID)'

function koncept.bingo:bingo/win/max/2 with storage bingo_list_player_win:data

tag @s remove bingo.check.max
scoreboard players set mx bingo.count.object.check.max -10