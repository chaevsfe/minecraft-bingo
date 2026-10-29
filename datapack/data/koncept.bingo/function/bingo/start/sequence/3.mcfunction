# Project created by the koncept

scoreboard players reset @s bingo.dynamic.advancement
scoreboard players reset @s bingo.dynamic.locator.bar

function koncept.bingo:bingo/start/team_join/team_add

scoreboard players enable @a bingo.startYes

tag @s add bingo.starter_game

scoreboard players enable @a bingo.startYes

scoreboard objectives remove bingo.started_game

scoreboard players reset @s bingo.startYes

scoreboard objectives add count_player_bingo dummy
scoreboard players set count count_player_bingo 0

scoreboard players enable @s bingo.leave.game.yes

# Run a cyclic file to start the game to select the type and difficulty
scoreboard players set start bingo.start.enable.trigger 1
scoreboard players set start bingo.start.launch.receipt 1

execute unless score mod bingo.companion matches 1 run tellraw @s [{"text":"\n"},{"translate":"bingo.team.select","color":"#ffcc64"},{"text":"\n"},{"text":"[","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.team.join","color":"red",click_event:{action:'run_command',command:"/trigger bingo.team.join.red"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"   "},{"text":"[","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.team.join","color":"dark_red",click_event:{action:'run_command',command:"/trigger bingo.team.join.dark_red"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"   "},{"text":"[","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.team.join","color":"yellow",click_event:{action:'run_command',command:"/trigger bingo.team.join.yellow"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"\n"},{"text":"[","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.team.join","color":"gold",click_event:{action:'run_command',command:"/trigger bingo.team.join.gold"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"   "},{"text":"[","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.team.join","color":"white",click_event:{action:'run_command',command:"/trigger bingo.team.join.white"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"   "},{"text":"[","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.team.join","color":"aqua",click_event:{action:'run_command',command:"/trigger bingo.team.join.aqua"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"\n"},{"text":"[","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.team.join","color":"green",click_event:{action:'run_command',command:"/trigger bingo.team.join.green"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"   "},{"text":"[","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.team.join","color":"blue",click_event:{action:'run_command',command:"/trigger bingo.team.join.blue"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"   "},{"text":"[","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.team.join","color":"light_purple",click_event:{action:'run_command',command:"/trigger bingo.team.join.light_purple"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]

execute unless score mod bingo.companion matches 1 run tellraw @a[tag=!bingo.starter_game] [{"translate":"bingo.status.started_by","color":"#ffcc64","with":[{"selector":"@s","color":"gold"}]},{"text":"\n"},{"translate":"bingo.status.participate_question","color":"#ffcc64"},{"text":" [","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.startYes"}},{"translate":"bingo.status.participate_yes","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.startYes"}},{"text":"]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.startYes"}}]

scoreboard objectives add bingo.start.game.timer dummy

scoreboard players add timer bingo.start.game.timer 1