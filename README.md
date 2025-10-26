# Petting Farm Sim 🐮

A mellow 2D top-down petting farm game.

## Demo
![Demo GIF: Petting cows](https://github.com/user-attachments/assets/3c5955d8-9346-4c5a-ac58-86a0d0896b0c)  
![Demo GIF: Entering the house](https://github.com/user-attachments/assets/e78084cb-2660-45d1-a92f-fcff55408dd1)  


## Description

I wanted to learn more about animation in Godot and controlling the movement of other characters. I used [this tutorial](https://www.youtube.com/watch?v=Luf2Kr5s3BM) to explore those topics, and then I continued working on the project to cement my knowledge and explore other things. Most notably, after finishing the tutorial I added player interaction (with cows and the house door), which was completely brand new to me in Godot. I did a lot of research into ways to approach this, and while it took me a while to initially set it up, it left me with something that was modular and easy to implement with various objects. The interaction system is now something I can use to add more to the game and increase the complexity.

I also practiced my animation knowledge to animate the door opening and closing. That was a helpful exploration, because it was similar enough to previous animations I had done that I had a decent foundation going into it. However, it was also slightly different, and included an added layer of complexity: the animation was to be the result of a player interaction *and* the object being animated needed to affect player movement (whether they could/could not pass through the door). I had two different ideas for ways to approach the challenge. I suspected my second idea was better, but I decided to go through with both approaches as a learning exercuse. (Both approaches did work! Though I had been correct in my initial assessment that my second idea was better, so that was the one I stuck with.)

Adding the points system, game timer, and main menu were relatively easy additions, since I had done those things in my other Godot projects. However, it was helpful to further exercise those skills in a new project.


## Features

- Player can walk around and pet cows (and the cows will react)
- Cows randomly move around
- Player has 20 seconds to pet as many cows as possible! They get points each time they pet a cow. But cows can only be pet while they're standing still.
- Player can also open doors to go inside buildings

## Possible Future Features/Improvements
- Add chickens that lay eggs on a timer. The player has to collect the eggs and bring them back inside the house for points.
- Switch between modes: zen mode (no timer) and game mode (timer)
- Score leaderboard
- Interaction with chests (maybe adds time to the timer?)
- Show interaction label above object instead of above player (to make it more clear what object is being interacted with)

## Known Bugs
- Cows: Sometimes cows play the walking animation without moving
- Cows: When cows and player touch, they can sometimes "carry" each other
- Cows: When cows hit a wall, they keep walking in that direction

## Resources

- Loosely based off tutorial: [Godot 4 Crash Course](https://www.youtube.com/watch?v=Luf2Kr5s3BM)
- Assets:
  - [Sprout Lands asset pack](https://cupnooble.itch.io/sprout-lands-asset-pack)
  - [Sprout Lands UI](https://cupnooble.itch.io/sprout-lands-ui-pack)
- Fonts:
  - [m6x11](https://managore.itch.io/m6x11)
  - [World of Fonts](https://w.itch.io/world-of-fonts)
