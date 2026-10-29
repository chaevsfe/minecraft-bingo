# Project created by the koncept
# Random selection
scoreboard objectives add bingo.timer.notifications.settings dummy
execute store result score cree77 bingo.timer.notifications.settings run random value 1..10

# macro
data modify storage bingo:timer.notifications.settings message_number set value {"x":0}
execute store result storage bingo:timer.notifications.settings message_number.x int 1 run scoreboard players get cree77 bingo.timer.notifications.settings
# file selection
function koncept.bingo:bingo/timer/notifications/random with storage bingo:timer.notifications.settings message_number

scoreboard objectives remove bingo.timer.notifications.settings