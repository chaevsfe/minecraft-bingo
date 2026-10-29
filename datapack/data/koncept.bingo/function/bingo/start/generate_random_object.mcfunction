# Project created by the koncept

# scoreboard bingo.start.spawn.item 
scoreboard objectives add bingo.start.spawn.item dummy
scoreboard players add start bingo.start.spawn.item 1

# count object
execute if score start bingo.start.spawn.item matches 1 run scoreboard players set count bingo.timer_count 0
execute if score start bingo.start.spawn.item matches 1 run scoreboard players reset random_object bingo.start.spawn.item

# start
execute if score start bingo.start.spawn.item matches 1.. run scoreboard players add random_object bingo.start.spawn.item 1
execute if score random_object bingo.start.spawn.item matches 5 if score count bingo.timer_count matches ..24 run function koncept.bingo:bingo/random_start {sound:1}
execute if score random_object bingo.start.spawn.item matches 5 if score count bingo.timer_count matches ..24 run scoreboard players reset random_object bingo.start.spawn.item

# bossbar
execute if score start bingo.start.spawn.item matches 1.. run execute as @a[tag=bingo.game.player] at @s run function koncept.bingo:bingo/bossbar/visible_false/start1
execute if score start bingo.start.spawn.item matches 1.. run execute as @a[tag=bingo.game.player] at @s run function koncept.bingo:bingo/bossbar/start

### end
# destroy
execute if score random_object bingo.start.spawn.item matches 5 if score count bingo.timer_count matches 25 run execute as @e[tag=bingo.destroy,type=minecraft:marker] at @s run tag @s add bingo.destroy.start

# scoreboard remove
execute if score random_object bingo.start.spawn.item matches 5 if score count bingo.timer_count matches 25 run scoreboard objectives remove bingo.start.spawn.item