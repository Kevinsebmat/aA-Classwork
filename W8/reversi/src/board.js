// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = []
  for (let i = 0; i < 8; i++) {
    let subArr = new Array(8)
    grid.push(subArr);
  }

  grid[3][4] = new Piece('black')
  grid[4][3] = new Piece('black')
  grid[3][3] = new Piece('white')
  grid[4][4] = new Piece('white')
  
  return grid;
}

console.log(_makeGrid());

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  
  let x = pos[0];
  let y = pos[1];
console.log(x, y);

  if ( pos[0] > 7 || pos[1] < 0  || pos[0] < 0 || pos[1] > 7) {
    return false;
  }
  else {
    return true;
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)){
    throw new Error('Not valid pos!')
  } 
else {
  return this.grid[pos[0]][pos[1]];
}
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.getPiece(pos) && this.getPiece(pos).color === color) {
        return true;
      } 
  else {
    return false;}
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let piece = this.getPiece(pos)
  if (typeof piece !== 'undefined'){
    return true;
  } else {return false}
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  let dirX= dir[0]
  let dirY= dir[1]
  let nextX= pos[0] + dirX
  let nextY= pos[1] + dirY
  let newpos= [nextX, nextY]
  let arr = [];
  while (this.isValidPos(newpos) && this.isOccupied(newpos)){
    if ( !this.isMine(newpos, color)){
      arr.push(newpos)
    } 
    else { break;}
    nextX += dirX
    nextY += dirY
    newpos = [nextX, nextY]
  }
  return arr;
};


/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE