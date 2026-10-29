# Project created by the koncept

execute as @s[nbt={Inventory: [{components: {"minecraft:charged_projectiles": [{id: "minecraft:firework_rocket"}]}, count: 1, id: "minecraft:crossbow"}]}] run function koncept.bingo:bingo/advancement/crossbow_firework
execute as @s[nbt={Inventory: [{components: {"minecraft:charged_projectiles": [{components: {"minecraft:intangible_projectile": {}}, id: "minecraft:firework_rocket"}]},count: 1,id:"minecraft:crossbow"}]}] run function koncept.bingo:bingo/advancement/crossbow_firework