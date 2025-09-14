# Memory Game

A 2D memory card matching game built with Godot 4.4+.

## About

This project was created as a code-along with modifications from the course "Jumpstart to 2D Game Development: Godot 4.4+ for Beginners". While following the core concepts and structure, several differences and improvements have been implemented to create a unique memory game experience.

## Features

- **Multiple Difficulty Levels**: 6 different levels with varying grid sizes (2x2 to 6x7)
- **Progressive Gameplay**: Start with easy 2x2 grids and work your way up to challenging 6x7 layouts
- **Visual Feedback**: Animated tile reveals with sound effects
- **Score Tracking**: Move counter and pairs found progress
- **Game Over Screen**: Completion celebration with move statistics
- **Responsive UI**: Clean and intuitive interface

## Game Mechanics

- Click on tiles to reveal their images
- Match pairs of identical images
- Complete all pairs to win the level
- Track your moves and progress
- Navigate between levels and main menu

## Technical Features

- **Signal-based Architecture**: Clean communication between game components
- **Resource Management**: Efficient image and sound loading
- **Modular Design**: Separated concerns with dedicated classes for different functionalities
- **Dynamic Grid Generation**: Procedural tile placement based on level settings

## Project Structure

```
├── Assets/           # Game assets (images, sounds, fonts)
├── Classes/          # Custom resource classes
├── Globals/          # Singleton managers
├── Resources/        # Game data resources
├── Scenes/           # Game scenes and UI
└── Tools/            # Utility scripts
```

## Getting Started

1. Open the project in Godot 4.4+
2. Run the main scene (`master.tscn`)
3. Select a difficulty level to start playing
4. Match all pairs to complete the level

## Credits

Based on the course "Jumpstart to 2D Game Development: Godot 4.4+ for Beginners" with custom modifications and improvements.


