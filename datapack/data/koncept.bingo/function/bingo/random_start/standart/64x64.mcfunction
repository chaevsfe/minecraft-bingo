# Project created by the koncept

#Random selection
execute store result score cree77 bingo.random run random value -114..90

#tellraw @a [{"text":"2 "},{"score":{"name":"cree77","objective":"bingo.random"}}]

#file selection
# 26.3
execute if score cree77 bingo.random matches -114..-112 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/concrete_slab_stairs
execute if score cree77 bingo.random matches -111..-109 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/poplar
execute if score cree77 bingo.random matches -108..-106 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/wool_slab_stairs
# 1.21.9
execute if score cree77 bingo.random matches -105..-93 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/shelf
execute if score cree77 bingo.random matches -92..-90 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/acacia
execute if score cree77 bingo.random matches -89..-87 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/andesite
execute if score cree77 bingo.random matches -86..-84 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/anvil
execute if score cree77 bingo.random matches -83..-81 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/bamboo
execute if score cree77 bingo.random matches -80..-78 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/banner
execute if score cree77 bingo.random matches -77..-75 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/bed
execute if score cree77 bingo.random matches -74..-72 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/birch
execute if score cree77 bingo.random matches -71..-69 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/bricks
execute if score cree77 bingo.random matches -68..-66 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/carpet
execute if score cree77 bingo.random matches -65..-63 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/cherry
execute if score cree77 bingo.random matches -62..-60 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/concrete
execute if score cree77 bingo.random matches -59..-57 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/concrete_powder
execute if score cree77 bingo.random matches -56..-54 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/dark_oak
execute if score cree77 bingo.random matches -53..-51 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/deepslate
execute if score cree77 bingo.random matches -50..-48 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/diorite
execute if score cree77 bingo.random matches -47..-45 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/glazed_terracotta
execute if score cree77 bingo.random matches -44..-42 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/granite
execute if score cree77 bingo.random matches -41..-39 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/jungle
execute if score cree77 bingo.random matches -38..-36 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/leaves
execute if score cree77 bingo.random matches -35..-33 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/mangrove
execute if score cree77 bingo.random matches -32..-30 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/mossy
execute if score cree77 bingo.random matches -29..-27 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/mud
execute if score cree77 bingo.random matches -26..-24 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/oak
execute if score cree77 bingo.random matches -23..-21 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/red_sand
execute if score cree77 bingo.random matches -20..-18 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/sand
execute if score cree77 bingo.random matches -17..-15 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/spruce
execute if score cree77 bingo.random matches -14..-12 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/stained_glass
execute if score cree77 bingo.random matches -11..-9 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/stone
execute if score cree77 bingo.random matches -8..-6 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/terracotta
execute if score cree77 bingo.random matches -5..-3 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/tuff
execute if score cree77 bingo.random matches -2..0 run return run function koncept.bingo:bingo/file_selection/standart/cluster/64x64/wool

execute if score cree77 bingo.random matches 1..5 run return run function koncept.bingo:bingo/file_selection/standart/64x64/1-5
execute if score cree77 bingo.random matches 6..10 run return run function koncept.bingo:bingo/file_selection/standart/64x64/6-10
execute if score cree77 bingo.random matches 11..15 run return run function koncept.bingo:bingo/file_selection/standart/64x64/11-15
execute if score cree77 bingo.random matches 16..20 run return run function koncept.bingo:bingo/file_selection/standart/64x64/16-20
execute if score cree77 bingo.random matches 21..25 run return run function koncept.bingo:bingo/file_selection/standart/64x64/21-25
execute if score cree77 bingo.random matches 26..30 run return run function koncept.bingo:bingo/file_selection/standart/64x64/26-30
execute if score cree77 bingo.random matches 31..35 run return run function koncept.bingo:bingo/file_selection/standart/64x64/31-35
execute if score cree77 bingo.random matches 36..40 run return run function koncept.bingo:bingo/file_selection/standart/64x64/36-40
execute if score cree77 bingo.random matches 41..45 run return run function koncept.bingo:bingo/file_selection/standart/64x64/41-45
execute if score cree77 bingo.random matches 46..50 run return run function koncept.bingo:bingo/file_selection/standart/64x64/46-50
execute if score cree77 bingo.random matches 51..55 run return run function koncept.bingo:bingo/file_selection/standart/64x64/51-55
execute if score cree77 bingo.random matches 56..60 run return run function koncept.bingo:bingo/file_selection/standart/64x64/56-60
execute if score cree77 bingo.random matches 61..65 run return run function koncept.bingo:bingo/file_selection/standart/64x64/61-65
execute if score cree77 bingo.random matches 66..70 run return run function koncept.bingo:bingo/file_selection/standart/64x64/66-70
execute if score cree77 bingo.random matches 71..75 run return run function koncept.bingo:bingo/file_selection/standart/64x64/71-75
execute if score cree77 bingo.random matches 76..80 run return run function koncept.bingo:bingo/file_selection/standart/64x64/76-80
execute if score cree77 bingo.random matches 81..85 run return run function koncept.bingo:bingo/file_selection/standart/64x64/81-85
execute if score cree77 bingo.random matches 86..90 run return run function koncept.bingo:bingo/file_selection/standart/64x64/86-90