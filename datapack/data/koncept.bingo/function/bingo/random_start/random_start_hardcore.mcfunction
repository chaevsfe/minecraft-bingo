# Project created by the koncept

#Random selection
scoreboard objectives add bingo.random_16.or_64 dummy

execute store result score cree77 bingo.random_16.or_64 run random value 1..40

#file selection standart
execute if score cree77 bingo.random_16.or_64 matches 1..6 run function koncept.bingo:bingo/random_start/standart/16x16
execute if score cree77 bingo.random_16.or_64 matches 7..12 run function koncept.bingo:bingo/random_start/standart/64x64

#file selection difficult
execute if score cree77 bingo.random_16.or_64 matches 13..19 run function koncept.bingo:bingo/random_start/difficult/16x16
execute if score cree77 bingo.random_16.or_64 matches 20..26 run function koncept.bingo:bingo/random_start/difficult/64x64

#file selection hardcore
execute if score cree77 bingo.random_16.or_64 matches 27..33 run function koncept.bingo:bingo/random_start/hardcore/16x16
execute if score cree77 bingo.random_16.or_64 matches 34..40 run function koncept.bingo:bingo/random_start/hardcore/64x64

scoreboard objectives remove bingo.random_16.or_64