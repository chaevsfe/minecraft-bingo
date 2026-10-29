# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..30

#file refinement

execute if score cree77 random_cluster matches 1 if score apple bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score apple bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:apple}

execute if score cree77 random_cluster matches 2 if score golden_apple bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score golden_apple bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_apple}

execute if score cree77 random_cluster matches 3 if score potato bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score potato bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:potato}

execute if score cree77 random_cluster matches 4 if score baked_potato bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score baked_potato bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:baked_potato}

execute if score cree77 random_cluster matches 5 if score carrot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score carrot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:carrot}

execute if score cree77 random_cluster matches 6 if score golden_carrot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score golden_carrot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_carrot}

execute if score cree77 random_cluster matches 7 if score chicken bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score chicken bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:chicken}

execute if score cree77 random_cluster matches 8 if score cooked_chicken bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score cooked_chicken bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cooked_chicken}

execute if score cree77 random_cluster matches 9 if score beef bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score beef bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:beef}

execute if score cree77 random_cluster matches 10 if score cooked_beef bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score cooked_beef bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cooked_beef}

execute if score cree77 random_cluster matches 11 if score mutton bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score mutton bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:mutton}

execute if score cree77 random_cluster matches 12 if score cooked_mutton bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score cooked_mutton bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cooked_mutton}

execute if score cree77 random_cluster matches 13 if score porkchop bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score porkchop bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:porkchop}

execute if score cree77 random_cluster matches 14 if score cooked_porkchop bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score cooked_porkchop bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cooked_porkchop}

execute if score cree77 random_cluster matches 15 if score rabbit bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score rabbit bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:rabbit}

execute if score cree77 random_cluster matches 16 if score cooked_rabbit bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score cooked_rabbit bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cooked_rabbit}

execute if score cree77 random_cluster matches 17 if score cod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score cod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cod}

execute if score cree77 random_cluster matches 18 if score cooked_cod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 18 if score cooked_cod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cooked_cod}

execute if score cree77 random_cluster matches 19 if score salmon bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 19 if score salmon bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:salmon}

execute if score cree77 random_cluster matches 20 if score cooked_salmon bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 20 if score cooked_salmon bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cooked_salmon}

execute if score cree77 random_cluster matches 21 if score tropical_fish bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 21 if score tropical_fish bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:tropical_fish}

execute if score cree77 random_cluster matches 22 if score beetroot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 22 if score beetroot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:beetroot}

execute if score cree77 random_cluster matches 23 if score sweet_berries bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 23 if score sweet_berries bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sweet_berries}

execute if score cree77 random_cluster matches 24 if score melon_slice bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 24 if score melon_slice bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:melon_slice}

execute if score cree77 random_cluster matches 25 if score cookie bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 25 if score cookie bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cookie}

execute if score cree77 random_cluster matches 26 if score pumpkin_pie bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 26 if score pumpkin_pie bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pumpkin_pie}

execute if score cree77 random_cluster matches 27 if score rabbit_stew bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 27 if score rabbit_stew bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:rabbit_stew}

execute if score cree77 random_cluster matches 28 if score beetroot_soup bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 28 if score beetroot_soup bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:beetroot_soup}

execute if score cree77 random_cluster matches 29 if score mushroom_stew bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 29 if score mushroom_stew bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:mushroom_stew}

execute if score cree77 random_cluster matches 30 if score suspicious_stew bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 30 if score suspicious_stew bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:suspicious_stew}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}