# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..20

#file refinement

execute if score cree77 random_cluster matches 1 if score music_disc_13 bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score music_disc_13 bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_13}

execute if score cree77 random_cluster matches 2 if score music_disc_cat bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score music_disc_cat bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_cat}

execute if score cree77 random_cluster matches 3 if score music_disc_blocks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score music_disc_blocks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_blocks}

execute if score cree77 random_cluster matches 4 if score music_disc_chirp bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score music_disc_chirp bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_chirp}

execute if score cree77 random_cluster matches 5 if score music_disc_far bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score music_disc_far bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_far}

execute if score cree77 random_cluster matches 6 if score music_disc_mall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score music_disc_mall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_mall}

execute if score cree77 random_cluster matches 7 if score music_disc_mellohi bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score music_disc_mellohi bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_mellohi}

execute if score cree77 random_cluster matches 8 if score music_disc_stal bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score music_disc_stal bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_stal}

execute if score cree77 random_cluster matches 9 if score music_disc_strad bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score music_disc_strad bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_strad}

execute if score cree77 random_cluster matches 10 if score music_disc_ward bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score music_disc_ward bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_ward}

execute if score cree77 random_cluster matches 11 if score music_disc_11 bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score music_disc_11 bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_11}

execute if score cree77 random_cluster matches 12 if score music_disc_creator_music_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score music_disc_creator_music_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_creator_music_box}

execute if score cree77 random_cluster matches 13 if score music_disc_wait bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score music_disc_wait bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_wait}

execute if score cree77 random_cluster matches 14 if score music_disc_creator bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score music_disc_creator bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_creator}

execute if score cree77 random_cluster matches 15 if score music_disc_precipice bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score music_disc_precipice bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_precipice}

execute if score cree77 random_cluster matches 16 if score music_disc_otherside bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score music_disc_otherside bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_otherside}

execute if score cree77 random_cluster matches 17 if score music_disc_relic bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score music_disc_relic bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_relic}

execute if score cree77 random_cluster matches 18 if score music_disc_5 bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 18 if score music_disc_5 bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_5}

execute if score cree77 random_cluster matches 19 if score music_disc_pigstep bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 19 if score music_disc_pigstep bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_pigstep}

execute if score cree77 random_cluster matches 20 if score music_disc_lava_chicken bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 20 if score music_disc_lava_chicken bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_lava_chicken}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}