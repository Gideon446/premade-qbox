[![YouTube Subscribe](https://img.shields.io/badge/YouTube-Subscribe-red?style=for-the-badge&logo=youtube)](https://youtu.be/iKb6hdepiBg?si=y_n2TzFzhxOvsLoe)
[![Discord](https://img.shields.io/badge/Discord-Join-blue?style=for-the-badge&logo=discord)](https://discord.gg/EkwWvFS)
[![Tebex Store](https://img.shields.io/badge/Tebex-Store-green?style=for-the-badge&logo=shopify)](https://eyestore.tebex.io/)
# ES-Scoreboard - Advanced FiveM Server Scoreboard System

![Screenshot 2025-04-17 21-37-32](https://github.com/user-attachments/assets/3c9971fa-588f-48bc-9eb4-b5265fc3d8ff)

A feature-rich and highly customizable player scoreboard system for FiveM roleplay servers. ES-Scoreboard provides a modern, user-friendly interface to display server player information with framework compatibility for QBCore and ESX.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Framework](https://img.shields.io/badge/framework-QBCore%20%7C%20ESX-orange.svg)

## Key Features
- 🎮 **Multi-Framework Support**: Seamless integration with QBCore and ESX frameworks
- 🎨 **Modern UI Design**: Sleek, responsive interface with beautiful animations and color coding
- 👮 **Job Classification**: Auto-categorizes players by profession (Police, EMS, Mechanic, etc.)
- 👤 **Player Statistics**: View player counts by job category with visual indicators
- 🔍 **Advanced Search**: Filter players by name, job, and other criteria
- 🔄 **Real-time Updates**: Data synchronization for accurate player information
- 🎭 **Customizable Themes**: Easily modifiable appearance to match your server's brand
- 📱 **Responsive Layout**: Adapts to different screen sizes and resolutions

## Preview
<!-- Add your screenshots here -->

## Installation
1. Download the latest release from the [releases page](https://github.com/yourusername/es-scoreboard/releases)
2. Extract the folder to your FiveM resources directory
3. Add `ensure es-scoreboard` to your server.cfg
4. Customize the `config.lua` file to match your server's needs
5. Restart your server

## Configuration
The scoreboard can be customized through the `main/shared.lua` config file:

```lua
Config = {
    Framework = 'QBCore',  -- QBCore or ESX or OLDQBCore or NewESX
    FakePlayers = true,    -- Show fake players when needed
    FakePlayerCount = 50,  -- Number of fake players to generate
    ServerEvents = true,   -- Show server events tab
    Debug = true,          -- Show debug messages
    UseTimeout = true,     -- Use timeout for callbacks
    TimeoutDuration = 5000 -- Callback timeout duration (ms)
}
```

## Usage
- Default key to open scoreboard: `J` (can be changed in keybindings)
- Search for players using the search bar
- Filter players by job type using the job tabs
- Sort players by name, ID, or job

## Technical Specifications
- 📦 Optimized resource with minimal performance impact (<0.1ms idle)
- 🛠️ Comprehensive configuration options
- 🧩 NUI-based interface using Vue.js for smooth performance
- 🔌 Support for custom job roles and titles
- 🖥️ Server-side player data caching to reduce load

## Dependencies
- QBCore or ESX framework

## Support
Join our [Discord server](https://discord.gg/EkwWvFS) for support and updates.
