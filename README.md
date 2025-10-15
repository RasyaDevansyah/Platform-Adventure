# Platform Adventure

A fun and challenging 2D platformer game developed as a solo project. This game was created for practice and has been published on itch.io.

![Platform Adventure Screenshot](https://github.com/user-attachments/assets/061cc95a-050c-4052-a0a5-4922fca23416)


## Overview

Platform Adventure is a classic 2D platformer featuring engaging gameplay, diverse levels, and interactive elements. The game was developed using Godot Engine.

### Core Systems:

*   **Player Mechanics**: Features responsive player controls with abilities such as jumping, dashing (implied by `arrow_boost`), and interaction with various environmental elements. Includes different enemy types and hazards like saws (`Saw.gd`), fire blocks (`fireBlock.gd`), and falling platforms (`falling_platform.gd`).

<img width="609" height="550" alt="image" src="https://github.com/user-attachments/assets/93bf1609-9c55-4a82-af4a-8f4a8c288abc" />


*   **Items and Collectibles**: Players can collect various items such as fruits (`Fruits.gd`), trophies (`Trophy.gd`), and other pickable objects (`PickableItem.gd`) that contribute to scoring or progression.

<img width="1450" height="550" alt="image" src="https://github.com/user-attachments/assets/e0aed8c3-bd5f-4b19-8304-191bb268410a" />


*   **User Interface (UI)**: A comprehensive UI system includes a main menu (`MainMenu.gd`), level selection screen (`level_select.gd`), in-game HUD (`InGameUI.gd`, `PlayerUI.gd`), and an achievements system (`achievements.gd`).

<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/d287313d-9b5e-42e2-ad14-a1b800097e64" />

<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/0cb8aef7-3639-4530-a558-ff452008246b" />

<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/f2dd91d5-ac42-4705-9c5f-7129d54c600f" />


*   **Game Flow Management**: Global scripts (`GlobalScript.gd`) manage game state, while transition scripts (`Transition.gd`) handle scene changes smoothly.

## Features

*   Multiple challenging levels.
*   Variety of enemies and environmental hazards.
*   Collectible items and scoring system.
*   Achievement system to track player accomplishments.
*   Intuitive main menu and level selection.

## Credits

*   **Development**: Rasya Devansyah (Solo Developer)
*   **Assets**: All game assets (graphics, sprites) are credited to [Pixel Frogs Pixel Adventure](https://pixelfrog-assets.itch.io/pixel-adventure-1).

## How to Play

Navigate through challenging levels by jumping and moving over obstacles to reach the trophy. Collect fruits to maximize your score and beat all the levels. This project can be exported to PC and HTML. (Mobile export is not yet supported.)

## Technologies Used

*   **Game Engine**: Godot Engine
