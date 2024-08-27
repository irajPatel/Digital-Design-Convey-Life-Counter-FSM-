Conway's Game of Life - Verilog Implementation
====================================================

Overview:
---------
Conway's Game of Life is a two-dimensional cellular automaton.
It is played on a grid where each cell can be in one of two states:
  - 1 (Alive)
  - 0 (Dead)

Rules:
------
At each time step, the state of each cell is determined by the number of its neighboring cells that are alive:
  - 0-1 neighbours: Cell becomes 0 (Dead).
  - 2 neighbours: Cell state remains unchanged.
  - 3 neighbours: Cell becomes 1 (Alive).
  - 4+ neighbours: Cell becomes 0 (Dead).

Grid Configuration:
--------------------
- The game is played on a 16x16 grid.
- The grid is modeled as a toroid, meaning the edges wrap around. 
  For example:
  - The corner cell at (0,0) has the following 8 neighbours:
    (15,1), (15,0), (15,15), (0,1), (0,15), (1,1), (1,0), (1,15).

Grid Representation:
---------------------
- The 16x16 grid is represented by a length 256 vector (q).
- Each row of the grid is represented by a 16-bit sub-vector:
  - q[15:0]  : Row 0
  - q[31:16] : Row 1
  - ...
  - q[255:240]: Row 15

Circuit Operations:
--------------------
- **load**: Loads data into the vector `q` at the next clock edge, initializing the game state.
- **q**: Represents the current 16x16 state of the game, updated on every clock cycle.

Game Evolution:
---------------
- The game state advances by one timestep every clock cycle.

More Information:
------------------
For further details about Conway's Game of Life, please visit the [Wikipedia page](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).
