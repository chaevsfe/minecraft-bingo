# Project created by the koncept

#Random selection
scoreboard objectives add bingo.random_16.or_64 dummy

execute store result score cree77 bingo.random_16.or_64 run random value 1..20

#file selection standart
execute if score cree77 bingo.random_16.or_64 matches 1..15 run function koncept.bingo:bingo/random_start/standart/16x16
execute if score cree77 bingo.random_16.or_64 matches 16..20 run function koncept.bingo:bingo/random_start/standart/64x64

scoreboard objectives remove bingo.random_16.or_64