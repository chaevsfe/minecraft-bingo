# Minecraft Bingo

[![Release](https://img.shields.io/github/v/release/chaevsfe/minecraft-bingo)](https://github.com/chaevsfe/minecraft-bingo/releases/latest)
![Minecraft](https://img.shields.io/badge/Minecraft-26.3-brightgreen)
![Fabric](https://img.shields.io/badge/loader-Fabric-dbd0b4)
[![License](https://img.shields.io/github/license/chaevsfe/minecraft-bingo)](LICENSE)

A Bingo datapack and resource pack for vanilla Minecraft 26.3, plus **Bingo Companion**, a server-side Fabric mod that replaces chat commands with chest menus. Players join with a vanilla client and only need the resource pack.

## Features

- **Chest menus** for everything: start a game, join a team, vote, view your card, change your settings
- **Team lobby** with nine teams, live votes for the mode (Line, Cross, Full House) and difficulty (Standard, Difficult, Hardcore), a ready button, and Start now for ops
- **Server sending**: move players between a Main server and the Bingo server, waking the Bingo server first if it's asleep
- **Team modifiers**: shared health, shared hunger, shared inventory, and a tether (4, 12, 32 or 64 blocks)
- **Beat the game**: a co-op mode where everyone works together to kill the Ender Dragon, with respawns
- **Team spread** up to 100,000 blocks, or keep everyone at the start
- **151 new items** for the cards
- Advancements and the player locator bar on or off for each game
- Move and resize the on-screen items, show or hide the timer

## Downloads & Installation

Download the latest version from the [Releases](https://github.com/chaevsfe/minecraft-bingo/releases) page. Each release includes the mod jar, the datapack zip and the resource pack zip.

Requires Minecraft 26.3 and Fabric Loader 0.20.1 or newer.

1. Install [Fabric Loader](https://fabricmc.net/use/server/) on your server.
2. Place the `bingo-companion` jar in the `mods` folder.
3. Place the datapack zip in `world/datapacks`.
4. Set `resource-pack` in `server.properties` to the resource pack zip from the release.

Clients only need resource pack.

## Commands (and permissions)

- `/bingo` - Main command, opens the right menu for the current game
- `/bingo start` - Opens the Start menu
- `/bingo join` - Opens the lobby
- `/bingo card` - Shows your Bingo card
- `/bingo settings` - Opens your settings
- `/bingo send [players]` - Sends players to the Bingo server (from Main server)
- `/bingo return [players]` - Sends players back to the Main server (from Bingo server)
- `/bingo reset` - Stops and resets the game (op level 2)
- `/bingo reset world` - Gives the server a fresh world at the next stop (op level 3)

## Configuration

You can find the config file in `./config/bingo-companion.json`. It's created on first start.

```json
{
  "role": "bingo",
  "bingo": { "host": "bingo.example.com", "port": 25565 },
  "vanilla": { "host": "main.example.com", "port": 25565 },
  "wake_timeout": 180
}
```

- `role`: `bingo` on the Bingo server, `vanilla` on the Main server. The Main server doesn't need the datapack or resource pack.
- `bingo`, `vanilla`: the address of each server.
- `wake_timeout`: how many seconds `/bingo send` waits for a sleeping Bingo server to start (AMP sleep mode). `0` sends at once.

Both servers need `accepts-transfers=true` in `server.properties`.

## Building from sources

The mod can be built with `./gradlew build` or `gradlew.bat` from the `companion` folder (Java 25).

## Reporting issues

[Open an issue](https://github.com/chaevsfe/minecraft-bingo/issues). Include logs, crash reports, and versions used.

## License

Bingo Companion is licensed under GNU LGPLv3. See [LICENSE](LICENSE).

The datapack and resource pack are based on [Minecraft Bingo](https://modrinth.com/mod/bingo-quest) by kontcept ([CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/), see [NOTICE](NOTICE)). Unofficial port, not affiliated with kontcept.
