# Project created by the koncept

#Random selection
execute store result score cree77 bingo.random run random value -143..147

#execute store result score cree77 bingo.random run random value 33..59

#tellraw @a [{"text":"1 "},{"score":{"name":"cree77","objective":"bingo.random"}}]

#file selection

# 26.3
execute if score cree77 bingo.random matches -143..-141 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/cushion
# 11
execute if score cree77 bingo.random matches -140..-136 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/nautilus_armor
execute if score cree77 bingo.random matches -135..-131 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/spear
# 1.21.9
execute if score cree77 bingo.random matches -130..-115 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/copper
# 1.21.6
execute if score cree77 bingo.random matches -114..-104 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/harness
execute if score cree77 bingo.random matches -103..-101 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/glass_pane
execute if score cree77 bingo.random matches -100..-95 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/stone_tools
execute if score cree77 bingo.random matches -94..-86 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/iron_tools_and_armor
execute if score cree77 bingo.random matches -85..-76 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/gold_tools_and_armor
execute if score cree77 bingo.random matches -75..-68 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/diamond_tools_and_armor
execute if score cree77 bingo.random matches -67..-63 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/bucket
execute if score cree77 bingo.random matches -62..-59 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/wooden
execute if score cree77 bingo.random matches -58..-57 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/sign
execute if score cree77 bingo.random matches -56..-53 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/sapling
execute if score cree77 bingo.random matches -52..-47 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/leather
execute if score cree77 bingo.random matches -46..-44 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/hanging_sign
execute if score cree77 bingo.random matches -43..-38 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/flowers
execute if score cree77 bingo.random matches -37..-36 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/door
execute if score cree77 bingo.random matches -35..-33 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/candle
execute if score cree77 bingo.random matches -32..-28 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/bundle
execute if score cree77 bingo.random matches -27..-26 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/chest_boat
execute if score cree77 bingo.random matches -25..-24 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/boat
execute if score cree77 bingo.random matches -23..-16 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/dye
execute if score cree77 bingo.random matches -15..0 run return run function koncept.bingo:bingo/file_selection/standart/cluster/16x16/food

execute if score cree77 bingo.random matches 1..5 run return run function koncept.bingo:bingo/file_selection/standart/16x16/1-5
execute if score cree77 bingo.random matches 6..10 run return run function koncept.bingo:bingo/file_selection/standart/16x16/6-10
execute if score cree77 bingo.random matches 11..15 run return run function koncept.bingo:bingo/file_selection/standart/16x16/11-15
execute if score cree77 bingo.random matches 16..20 run return run function koncept.bingo:bingo/file_selection/standart/16x16/16-20
execute if score cree77 bingo.random matches 21..25 run return run function koncept.bingo:bingo/file_selection/standart/16x16/21-25
execute if score cree77 bingo.random matches 26..30 run return run function koncept.bingo:bingo/file_selection/standart/16x16/26-30
execute if score cree77 bingo.random matches 31..35 run return run function koncept.bingo:bingo/file_selection/standart/16x16/31-35
execute if score cree77 bingo.random matches 36..40 run return run function koncept.bingo:bingo/file_selection/standart/16x16/36-40
execute if score cree77 bingo.random matches 41..45 run return run function koncept.bingo:bingo/file_selection/standart/16x16/41-45
execute if score cree77 bingo.random matches 46..50 run return run function koncept.bingo:bingo/file_selection/standart/16x16/46-50
execute if score cree77 bingo.random matches 51..55 run return run function koncept.bingo:bingo/file_selection/standart/16x16/51-55
execute if score cree77 bingo.random matches 56..60 run return run function koncept.bingo:bingo/file_selection/standart/16x16/56-60
execute if score cree77 bingo.random matches 61..65 run return run function koncept.bingo:bingo/file_selection/standart/16x16/61-65
execute if score cree77 bingo.random matches 66..70 run return run function koncept.bingo:bingo/file_selection/standart/16x16/66-70
execute if score cree77 bingo.random matches 71..75 run return run function koncept.bingo:bingo/file_selection/standart/16x16/71-75
execute if score cree77 bingo.random matches 76..80 run return run function koncept.bingo:bingo/file_selection/standart/16x16/76-80
execute if score cree77 bingo.random matches 81..85 run return run function koncept.bingo:bingo/file_selection/standart/16x16/81-85
execute if score cree77 bingo.random matches 86..90 run return run function koncept.bingo:bingo/file_selection/standart/16x16/86-90
execute if score cree77 bingo.random matches 91..95 run return run function koncept.bingo:bingo/file_selection/standart/16x16/91-95
execute if score cree77 bingo.random matches 96..100 run return run function koncept.bingo:bingo/file_selection/standart/16x16/96-100
execute if score cree77 bingo.random matches 101..105 run return run function koncept.bingo:bingo/file_selection/standart/16x16/101-105
execute if score cree77 bingo.random matches 106..110 run return run function koncept.bingo:bingo/file_selection/standart/16x16/106-110
execute if score cree77 bingo.random matches 111..115 run return run function koncept.bingo:bingo/file_selection/standart/16x16/111-115
execute if score cree77 bingo.random matches 116..120 run return run function koncept.bingo:bingo/file_selection/standart/16x16/116-120
execute if score cree77 bingo.random matches 121..125 run return run function koncept.bingo:bingo/file_selection/standart/16x16/121-125
execute if score cree77 bingo.random matches 126..130 run return run function koncept.bingo:bingo/file_selection/standart/16x16/126-130
# 1.21.5
execute if score cree77 bingo.random matches 131..135 run return run function koncept.bingo:bingo/file_selection/standart/16x16/131-135
execute if score cree77 bingo.random matches 136..140 run return run function koncept.bingo:bingo/file_selection/standart/16x16/136-140
#26.1
execute if score cree77 bingo.random matches 141..145 run return run function koncept.bingo:bingo/file_selection/standart/16x16/141-145
# 26.3
execute if score cree77 bingo.random matches 146..147 run return run function koncept.bingo:bingo/file_selection/standart/16x16/146-150
