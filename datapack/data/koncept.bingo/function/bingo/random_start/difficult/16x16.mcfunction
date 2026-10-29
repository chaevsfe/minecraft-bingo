# Project created by the koncept

#Random selection
execute store result score cree77 bingo.random run random value -19..34

#tellraw @a [{"text":"1 "},{"score":{"name":"cree77","objective":"bingo.random"}}]

#file selection
# 26.3
execute if score cree77 bingo.random matches -19..-17 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/16x16/cartographer_maps
execute if score cree77 bingo.random matches -16..-15 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/16x16/copper
execute if score cree77 bingo.random matches -14..-13 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/16x16/sniffer
execute if score cree77 bingo.random matches -12..-9 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/16x16/pale
execute if score cree77 bingo.random matches -8..-6 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/16x16/warped
execute if score cree77 bingo.random matches -5..-3 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/16x16/crimson
execute if score cree77 bingo.random matches -2..0 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/16x16/door

execute if score cree77 bingo.random matches 1..5 run return run function koncept.bingo:bingo/file_selection/difficult/16x16/1-5
execute if score cree77 bingo.random matches 6..10 run return run function koncept.bingo:bingo/file_selection/difficult/16x16/6-10
execute if score cree77 bingo.random matches 11..15 run return run function koncept.bingo:bingo/file_selection/difficult/16x16/11-15
execute if score cree77 bingo.random matches 16..20 run return run function koncept.bingo:bingo/file_selection/difficult/16x16/16-20
execute if score cree77 bingo.random matches 21..25 run return run function koncept.bingo:bingo/file_selection/difficult/16x16/21-25
# 1.21.6
execute if score cree77 bingo.random matches 26..30 run return run function koncept.bingo:bingo/file_selection/difficult/16x16/26-30
# 26.3
execute if score cree77 bingo.random matches 31..34 run return run function koncept.bingo:bingo/file_selection/difficult/16x16/31-35