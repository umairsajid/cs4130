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
        val count        : int;                     // Number of successful arrangements
        val open_spots   : ArrayList[Point{rank==2}];  // Arraylist of currently open points
        val num_queens   : int;                  //number of queens successfully placed 
        val board_size   : int;                  // size of the board i.e. N 

	count = 0n;
	num_queens = size;
	board_size = size; 
	open_spots = new ArrayList[Point{rank==2}]();


	/* add all available spaces to our open spaces array */	
        for(var i:Int = 0n; i < size; i++) {
		for(var j:Int = 0n;j<size; j++){ 
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

	
	Console.ERR.println(open_spots);

        /* call place on each space in the first free column. will need to be making copies of the board */
	while(open_spots.size()>0){
		break;
	}

	return count;
    }

    /** Place a queen asynchronously in each of the spaces free in the first column (-,x) */
    public def place(space: int, board:ArrayList[Point{rank==2}])  
    {
        // Will need to call block for spaces on each placed queen
    }



    /* we'll need to be blocking out points frequently */
    public def block(point: Point{rank==2}, board: ArrayList[Point{rank==2}]) 
    {
	board.remove(point);
    }

    public def block_queen(point: Point{rank==2}, size:int, board: ArrayList[Point{rank==2}]) 
    {
    // Block all in same column
        for(var i:Int = 0n; i < board.size(); i++) {
		//if(board.get(0)
	}
    // Block all in same row
        for(var j:Int = 0n; j < board.size(); j++) {
    	
	}
    // Block all on diagonal
        for(var k:Int = 0n; k < board.size(); k++) {

	}
    }

}
