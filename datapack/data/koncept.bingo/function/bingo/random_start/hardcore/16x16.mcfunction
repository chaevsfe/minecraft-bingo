# Project created by the koncept

#Random selection
execute store result score cree77 bingo.random run random value -29..32

#tellraw @a [{"score":{"name":"cree77","objective":"bingo.random"}}]

#file selection
# 26.3
execute if score cree77 bingo.random matches -29..-27 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/16x16/explorer_maps
execute if score cree77 bingo.random matches -26..-21 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/16x16/trim_smithing_template
execute if score cree77 bingo.random matches -20..-18 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/16x16/pottery_sherd
execute if score cree77 bingo.random matches -17..-15 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/16x16/netherite
execute if score cree77 bingo.random matches -14..-12 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/16x16/music_disc
execute if score cree77 bingo.random matches -11..-9 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/16x16/coral
execute if score cree77 bingo.random matches -8..-6 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/16x16/chainmail
execute if score cree77 bingo.random matches -5..-3 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/16x16/banner_pattern
execute if score cree77 bingo.random matches -2..0 run return run function koncept.bingo:bingo/file_selection/hardcore/cluster/16x16/amethyst

execute if score cree77 bingo.random matches 1..5 run return run function koncept.bingo:bingo/file_selection/hardcore/16x16/1-5
execute if score cree77 bingo.random matches 6..10 run return run function koncept.bingo:bingo/file_selection/hardcore/16x16/6-10
execute if score cree77 bingo.random matches 11..15 run return run function koncept.bingo:bingo/file_selection/hardcore/16x16/11-15
execute if score cree77 bingo.random matches 16..20 run return run function koncept.bingo:bingo/file_selection/hardcore/16x16/16-20
execute if score cree77 bingo.random matches 21..25 run return run function koncept.bingo:bingo/file_selection/hardcore/16x16/21-25
execute if score cree77 bingo.random matches 26..30 run return run function koncept.bingo:bingo/file_selection/hardcore/16x16/26-30
# 1.21.7 increased chance of music_disc_lava_chicken
execute if score cree77 bingo.random matches 31..32 run return run function koncept.bingo:bingo/file_selection/hardcore/16x16/31-35