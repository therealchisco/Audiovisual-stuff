# Planarity Prototypes

A collection of game prototypes inspired by the [Planarity Puzzle Game](https://en.wikipedia.org/wiki/Planarity)

All prototypes are implemented using [Processing](https://processing.org/)

## Table of Contents

* [Puzzle Generation Algorithms](#puzzle)
    *[Original Algorithm](#original)

* [Intersecton Detection Alogrithms](#interesction)
    *


# Puzzle Generation <a name="puzzle"></a>

The actual game of planarity does not depend on how the planar graphs in the puzzle are generated.
Here's a few of the experimets we've done implementing different algorithms that generate random planar graphs.

## Original Planarity puzzle generation algorithm <a name="original"></a>

This is an implementation of the original algorithm by John Tantalo

For more information refer to the [wikipedia article](https://en.wikipedia.org/wiki/Planarity#Puzzle_generation_algorithm)

> 1. Generate a set of random lines in a plane such that no two lines are parallel and no three lines meet in a single point.
2. Calculate the intersections of every line pair.
3. Create a graph with a vertex for each intersection and an edge for each line segment connecting two intersections (the arrangement of the lines).

### Notes
Some ambiguity exists in the "every line pair" statement:
