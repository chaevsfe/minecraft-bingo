$execute if score count bingo.count.object.check.max.text matches 1 run data modify storage bingo_list_player_win:data text_temp set value '$(text_temp),$(text)'

$execute if score count bingo.count.object.check.max.text matches 2.. run data modify storage bingo_list_player_win:data text_temp set value '$(text_temp),{"text":", "},$(text)'