import x10.util.Timer;
import x10.util.ArrayList;

/**
 * This is the class that provides the solve() method.
 * 
 * The assignment is to replace the contents of the solve() method
 * below with code that actually works :-)
 */
public class Solver
{  
    /**
     * Solve a single 'N'-Queens with pawns problem.
     *     'size' is 'N'.
     *     'pawns' is an array of bidimensional Point {rank==2} with the locations of pawns.  The array may be of length zero.
     *
     * This function should return the number of solutions for the given configuration.
     * 1. Build a list of the places we can place queens, taking into account any pawns.
     * 2. Place queens asynchronously
     * 3. Block out conflicting spaces
     * 4. Go to 2
     */
    public def solve(size: int, pawns: ArrayList[Point{rank==2}]) : int
    {
        val open_spots   : ArrayList[Point{rank==2}];  // Arraylist of currently open points
        val num_queens   : int = size;                  //number of queens successfully placed 
        val board_size   : int = size;                  // size of the board i.e. N 

	open_spots = new ArrayList[Point{rank==2}]();


	/* add all available spaces to our open spaces array */	
        for(var i:int = 0n; i < size; i++) {
		for(var j:int = 0n;j<size; j++){ 
			val pt : Point{rank==2} = [i,j];
			open_spots.add(pt);
		}	
	}
	
	/* Block pawn spaces */
	while(pawns.size() > 0){
		Console.OUT.print(".");
		block(pawns.get(0), open_spots);
		pawns.removeFirst();
	}

	
        /* call place on each space in the first free column. will need to be making copies of the board */
	if(open_spots.size()>0){
		val col_to_place : int = open_spots.get(0)(0) as Int;	
		val count : int = place(col_to_place, open_spots, 0n, num_queens);
		return count;
	}
	return 0n;
    }

    /** Place a queen asynchronously in each of the spaces free in the first column (-,x) */
    public def place(column: int, board:ArrayList[Point{rank==2}], carry: int, queens:int) : int 
    {
 
	/* Steps:
	 * 1. Duplicate board.
	 * 2. Place queen
	 * 3. Call block_queens 
	 * 4. call place with column +1
   	 *
	 * If this method can place N queens before the board is empty,
	 * it is successful and should return 1. Else we could not place the queens
	 * in any subconfiguration base on the start config, so return 0. Count will 
	 * call place once for each of the N rows in the first column, and sum the results
         */

	var count:int = carry;	
	var num_queens:int = queens;

 	for(var i:int = 0n;i<board.size();i++){
		// Verify that we're only going to attempt to place
		// queens in the col_to_place
		if(column == board.get(i)(0) as Int){
		//Asynchronously place queen with a copy of the board
			val new_board : ArrayList[Point{rank==2}];  // Arraylist of currently open points
			new_board = board.clone();	
			block_queen(board.get(i), new_board);
			num_queens--;
			if(num_queens==0n){
				return 1n;
			}
			count += place(column+1n,new_board,count,num_queens);
		}
		// else evaluated when there are less than N free spaces
		// in the column col_to_place. we can terminate the for loop.
		else {
			break;
		}
	}
	return count;
    }



    /* we'll need to be blocking out points frequently */
    public def block(point: Point{rank==2}, board: ArrayList[Point{rank==2}]) 
    {
	board.remove(point);
    }

    public def block_queen(point: Point{rank==2}, board: ArrayList[Point{rank==2}]) 
    {
    // Block all in same column
        for(var i:Int = 0n; i < board.size(); i++) {
		//Remove point if column equals point column
		if(board.get(i)(0)==point(0)){
			block(board.get(i), board);	
		}
	}
    // Block all in same row
        for(var j:Int = 0n; j < board.size(); j++) {
		//Remove point if row equals point row
		if(board.get(j)(0)==point(0)){
			block(board.get(j), board);	
		}
	}
    // Block all on diagonal
        for(var k:Int = 0n; k < board.size(); k++) {
		//Remove point if (x,y) = (point_x + k, point_y + k) 
		if(board.get(k)(0)==point(0)){
			block(board.get(k), board);	
		}
	}
    }

}
