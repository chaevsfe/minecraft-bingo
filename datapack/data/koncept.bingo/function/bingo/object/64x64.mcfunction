# Project created by the koncept

#Blocks this object so it won't fall out a second time
$scoreboard players set $(object) bingo.restart.replay 1

#Counting object number
scoreboard players add count bingo.timer_count 1
execute store result storage timer:count count int 1 run scoreboard players get count bingo.timer_count

#Setting a specific object
$data modify storage timer:count object set value $(object)

#Setting the data for this object
$function koncept.bingo:bingo/64x64_set/$(object) with storage timer:count