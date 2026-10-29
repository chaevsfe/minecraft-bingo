# Project created by the koncept

#Random selection
execute store result score cree77 bingo.random run random value -35..10

#file selection
# 1.21.9
execute if score cree77 bingo.random matches -35..-30 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/skull

execute if score cree77 bingo.random matches -29..-27 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/froglight
execute if score cree77 bingo.random matches -26..-24 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/grass
execute if score cree77 bingo.random matches -23..-21 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/ice
execute if score cree77 bingo.random matches -20..-18 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/ore
execute if score cree77 bingo.random matches -17..-15 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/purpur_block
execute if score cree77 bingo.random matches -14..-12 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/sculk
execute if score cree77 bingo.random matches -11..-9 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/shulker_box
execute if score cree77 bingo.random matches -8..-6 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/skull
execute if score cree77 bingo.random matches -5..-3 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/coral_block
execute if score cree77 bingo.random matches -2..0 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/64x64/end_stone

execute if score cree77 bingo.random matches 1..5 run return run function koncept.bingo:bingo/file_selection/hardcore/64x64/1-5
execute if score cree77 bingo.random matches 6..10 run return run function koncept.bingo:bingo/file_selection/hardcore/64x64/6-10