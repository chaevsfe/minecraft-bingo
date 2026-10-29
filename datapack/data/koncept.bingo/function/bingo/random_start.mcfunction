# Project created by the koncept

scoreboard objectives add bingo.sound dummy

$scoreboard players add sound bingo.sound $(sound)

scoreboard players set cree77 bingo.random_start 0

execute if score sound bingo.sound matches 1 run playsound minecraft:block.note_block.bit master @a[tag=bingo.game.player] ~ ~ ~ 99999999999999999999999999 1

execute if score win bingo.vote.difficulty.win matches 1 if score count bingo.timer_count matches ..24 run function koncept.bingo:bingo/random_start/random_start_standart
execute if score win bingo.vote.difficulty.win matches 2 if score count bingo.timer_count matches ..24 run function koncept.bingo:bingo/random_start/random_start_difficult
execute if score win bingo.vote.difficulty.win matches 3 if score count bingo.timer_count matches ..24 run function koncept.bingo:bingo/random_start/random_start_hardcore

scoreboard objectives remove bingo.sound