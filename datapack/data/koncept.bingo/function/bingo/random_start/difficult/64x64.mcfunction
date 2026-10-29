# Project created by the koncept

#Random selection
execute store result score cree77 bingo.random run random value -75..20

#tellraw @a [{"text":"2 "},{"score":{"name":"cree77","objective":"bingo.random"}}]

#file selection
# 26.3
execute if score cree77 bingo.random matches -75..-69 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/cinnabar
execute if score cree77 bingo.random matches -68..-62 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/sulfur
# 1.21.9
execute if score cree77 bingo.random matches -61..-56 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/copper_1_21_9

execute if score cree77 bingo.random matches -55..-51 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/resin
execute if score cree77 bingo.random matches -50..-48 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/pale
execute if score cree77 bingo.random matches -47..-39 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/copper
execute if score cree77 bingo.random matches -38..-32 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/blackstone
execute if score cree77 bingo.random matches -31..-28 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/nether_brick
execute if score cree77 bingo.random matches -27..-23 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/quartz
execute if score cree77 bingo.random matches -22..-17 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/prismarine
execute if score cree77 bingo.random matches -16..-10 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/crimson
execute if score cree77 bingo.random matches -9..-3 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/warped
execute if score cree77 bingo.random matches -2..0 run return run function koncept.bingo:bingo/file_selection/difficult/cluster/64x64/red_nether_brick

execute if score cree77 bingo.random matches 1..5 run return run function koncept.bingo:bingo/file_selection/difficult/64x64/1-5
execute if score cree77 bingo.random matches 6..10 run return run function koncept.bingo:bingo/file_selection/difficult/64x64/6-10
execute if score cree77 bingo.random matches 11..15 run return run function koncept.bingo:bingo/file_selection/difficult/64x64/11-15
# 1.21.6
execute if score cree77 bingo.random matches 16..20 run return run function koncept.bingo:bingo/file_selection/difficult/64x64/16-20