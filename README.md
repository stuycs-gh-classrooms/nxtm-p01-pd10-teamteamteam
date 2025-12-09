[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Mfyqb_T6)
# NeXtCS Project 01
### thinker0: Haley Heredia
### thinker1: FRIST LSAT
---

### Overview
Your mission is create either:
- Life-like cellular automata [life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), [life-like](https://en.wikipedia.org/wiki/Life-like_cellular_automaton), [demo](https://www.netlogoweb.org/launch#https://www.netlogoweb.org/assets/modelslib/Sample%20Models/Computer%20Science/Cellular%20Automata/Life.nlogo).
- Breakout/Arkanoid [demo 0](https://elgoog.im/breakout/)  [demo 1](https://www.crazygames.com/game/atari-breakout)
- Space Invaders/Galaga
  //
- A classic game that we have made pieces of in class. This style game should have:

    A grid of "enemies" that move across and down, and also shoot the player.
    A user controlled "spaceship" for shooting projectiles.
    Projectiles that collide and destroy enemies.

In addition to basic gameplay, if you choose space invaders your program must have the following:

    A set number (more than one) of "lives".
    The ability to play/pause the game.
    The ability to reset the game.
    Some continuation of the game if all the enemies have been destroyed.
    Different kinds of enemies (possible differences are movement, health, speed, etc)
//

This project will be completed in phases.  
The first phase will be to work on this document. 
* Use markdown formatting.
* For more markdown help
  - [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or
  - [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)


---

## Phase 0: Selection, Analysis & Plan

#### Selected Project: Space Invaders/Galaga

### Necessary Features
What are the core features that your program should have? These should be things that __must__ be implemented in order to make the program useable/playable, not extra features that could be added to make the program more interesting/fun.

alien:
- A grid (w/ and established size) that represents the enemy aliens
- if hit w/ projectiles, these aliens (or circles or squares or whatever they may visually be) will dissapear from the grid
- these aliens also shoot thier own projectiles
- variation among the enemies (ex. movement, speed, health or smthn)
  ---->  ex. if row (first num of array like [a][b]) if = to a certain number, a certain type of alien will be called_

player:
- @ a button press (space?), "player" shoots projectile.
- Can be moved LEFT/RIGHT

  
ui/ game stuffs:
- play/pause button (p)
- reset button (r)
- if you run out of enemies do you just reset?

### Extra Features
- cosmetics (ex. colored aliens, with color changing w/ each row)
- "sheild" which can take more than 1 hit before being completely destroyed?
- points/high score
- timer?



### Array Usage
How will you be using arrays in this project?

1D Array:
- player?

2D Array:
- grid (aliens)


### Controls
How will your program be controlled? List all keyboard commands and mouse interactions.

Keyboard Commands:
//UI & ??projectile??
- void keyPressed (){
  if (key == 'r'){
  //something that reverts game to OG setup
  }
  if (key == 'p'){
  //an established boolean of "playing" would be set to true/false.
  //or should playing and pause be seperate buttons?
  }
  if (key == ' '){
  //fire projectile that has the same x cor as player when this button is pressed.
  //then just goes up until it hits an alien
  }
  
  }

//player
- something for movement (LEFT/RIGHT)
- --> maybe set the direction as a conditon and, if true, player location x cor moves +-1
- 
  

Mouse Control:
- Mouse movement:N/A
- Mouse pressed:N/A


### Classes
What classes will you be creating for this project? Include the instance variables and methods that you believe you will need. You will be required to create at least 2 different classes. If you are going to use classes similar to those we've made for previous assignments, you will have to add new features to them.

//likely similar to ball class in w32_balllGrid
//seperate player and alien entities since they have their respectives projectiles?
player
- Instance variables:
PVector center
int xspeed
int yspeed
int pSize

- METHODS
display
move (lets you move player x cor +-)
collision (if player is hit by alien projectile a certain nuber of times, game ends ).
--> ex. have an int for lives that decreases by 1 if collison == true. when that int == 0 game ends.


alien
//shpuld a new class be made for each type of alien (ex more health, different speed)?
- Instance variables:
PVector center
int xspeed
int yspeed
int aSize
// boolean edge
--> changes direction and moves down a little if this is true. checked by comparing distance of grid and screen edge
- METHODS
display
collison (if alien at a certain array index gets hit (collision = true) it dissapears)
  
