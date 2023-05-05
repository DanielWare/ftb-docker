# ftb-server
## Containerized FTB Server

```yaml
version: "3.3"

services:
  ftb:
    image: ghcr.io/danielware/ftb-server:latest
    environment:
      - MOD_PACK_ID=103 # ftb skies
      # - VERSION_ID=6465 # version id (optionally leave blank for the latest version)
    volumes:
      - ftb-data:/ftb
    ports:
      - "25565:25565"
      
volumes:
  ftb-data:
```

| Mod Pack | Id
| :----- | :-----
| FTB Skies | 103
| FTB Legend of the Eyes | 102
| FTB Presents Direwolf20 1.19 | 101
| FTB StoneBlock 3 | 100
| FTB Inferno | 99
| FTB One | 97
| FTB Plexiglass Mountain | 96
| FTB Presents Direwolf20 1.18 | 95
| FTB Chocolate | 94
| FTB Ultimate: Anniversary Edition | 93
| FTB OceanBlock | 91
| FTB University 1.16 | 90
| FTB Competition Pack | 89
| FTB Academy 1.16 | 88
| FTB Cotton | 86
| Vanilla | 81
| FTB Endeavour | 80
| FTB Presents Direwolf20 1.16 | 79
| FTB Mage Quest | 78
| YogCraft Modpack | 77
| FTB Ultimate | 76
| FTB Tech World | 75
| Magic World | 73
| FTB Lite 2 | 72
| Direwolf20 1.4.7 | 70
| MindCrack Pack | 69
| Feed The Beast Retro SMP | 68
| MindCrack Pack | 66
| FTB Monster | 65
| FTB Horizons | 62
| FTB Presents Direwolf20 - 1.6.4 | 61
| FTB Magic World 2 |  60
| FTB Tech World 2 | 59
| Pax East 2014 Map | 58
| FTB Lite | 56
| FTB Pax Challenge Pack 2013 | 54
| FTB University 1.12 | 52
| FTB Unstable 1.16 | 47
| FTB Revelation | 35
| FTB Continuum | 34
| FTB Sky Adventures | 33
| FTB Pyramid Reborn 3.0 | 32
| FTB Presents Direwolf20 1.12 | 31
| FTB Unstable 1.12 | 30
| FTB Horizons III | 29
| FTB Beyond | 28
| FTB Egg Hunt | 27
| FTB SkyFactory Challenges | 26
| FTB Presents Skyfactory 3 | 25
| FTB Infinity Evolved 1.7 | 23
| FTB Presents Crackpack | 22
| FTB Inventions | 21
| FTB Infinity Evolved Skyblock | 20
| FTB Presents Skyfactory 2.5 | 19
| FTB Vanilla+ | 18
| FTB Horizons: Daybreaker | 17
| FTB Departed | 16
| FTB Presents Cloud 9 | 15
| FTB Presents HermitPack | 9
| FTB Sky Odyssey | 8
| FTB Unstable 1.14 | 7
| FTB Omnia | 6
| FTB Interactions | 5
| FTB Presents Stoneblock 2 | 4
| FTB Academy 1.12 | 1
