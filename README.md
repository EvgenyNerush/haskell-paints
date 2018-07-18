# haskell-paints
WARNING: All below is not yet realized, these are todos!

Lets rethink standard *red-green-blue* approach to colors in plots. In a plot, things can be
grouped or contrasted by a colour. For example, one group of things can be drawn with shades of
red, and the other with shades of blue. Or one can be drawn with light pale colors, while the other
with deep dark colors. One do not really need a palette with some red, green and blue, but he need
getters of colors based on some artistic characteristics of colors. Also, in order to minimize
manual color selection, one need generators that can provides beautiful large color sets on a base
of small color sets.

This repo contains two packages: *haskell-paints* and *haskell-paints-examples*. They provide:
* Additional colours for Haskell
* Functions that creates a color matrix for a given color set and convert the matrix to a new set
* Useful getters for color sets

## Color set
A color set is just a list of colors (*colour* package is used).

## Color matrix
A color matrix for a list of *n* colors is a matrix (*n x n* table) of colors obtained by blending
with each other the colors from the initial color set. As the color matrix is symmetric, in
*paints* it is represented as *n* and a list of *n (n + 1) / 2* colors. A color matrix can be
converted to a color set.

## Sorters and getters
The color set can be sorted as follows: dark first, light first, pale first, saturated first, deep
first, pastels first. The sort by a similarity with the given color (like shades of the color) is
also possible.  Also, the specially shuffled lists can be obtained, like dark-light-dark-light etc.

The package provides two kinds of getters:
* for a color matrix, by the matrix coordinates (by pairs of indeces which start from 0),
* for a color set, by a single index.

## Performance...
...is not the main goal of this package.

## Examples
To build examples, one needs *diagrams* package with png support.
