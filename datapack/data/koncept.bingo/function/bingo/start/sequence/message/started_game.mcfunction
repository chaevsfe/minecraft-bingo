# Project created by the koncept

scoreboard objectives add bingo.started_game trigger

scoreboard players enable @s bingo.started_game

tellraw @s [{"translate":"bingo.status.started","color":"red"}]

