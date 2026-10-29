scoreboard objectives remove bingo.count.object.check.max
scoreboard objectives add bingo.count.object.check.max dummy
scoreboard objectives remove bingo.count.object.check.max.text
scoreboard objectives add bingo.count.object.check.max.text dummy

scoreboard players set mx bingo.count.object.check.max -10

data remove storage bingo_list_player_win:data text
data remove storage bingo_list_player_win:data text_temp
data modify storage bingo_list_player_win:data text_temp set value '""'

function koncept.bingo:bingo/win/max/loop