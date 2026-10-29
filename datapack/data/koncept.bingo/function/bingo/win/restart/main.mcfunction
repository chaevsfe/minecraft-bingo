# Project created by the koncept

execute if score bingo.win.restart bingo.win.restart matches 1 run playsound minecraft:block.note_block.bell master @a[tag=bingo.game.player] 0 0 0 999999999999999999999 0.63
execute if score bingo.win.restart bingo.win.restart matches 4 run playsound minecraft:block.note_block.bell master @a[tag=bingo.game.player] 0 0 0 999999999999999999999 0.7
execute if score bingo.win.restart bingo.win.restart matches 8 run playsound minecraft:block.note_block.bell master @a[tag=bingo.game.player] 0 0 0 999999999999999999999 0.63
execute if score bingo.win.restart bingo.win.restart matches 1.. run scoreboard players add bingo.win.restart bingo.win.restart 1
execute if score bingo.win.restart bingo.win.restart matches 200.. run function koncept.bingo:bingo/win/restart/restart_time
execute if score bingo.win.restart bingo.win.restart matches 260.. run function koncept.bingo:bingo/win/restart/restart_time1