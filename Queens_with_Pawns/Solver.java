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
     */
    public def solve(size: int, pawns: ArrayList[Point{rank==2}]) : int
    {
        // Your solution goes here
        int count = 0; //Solutions count
	
	/*
	 * 1. Build a list of the places we can place queens, taking into account any pawns.
	 * 2. Place queens asynchronously
	 * 3. Block out conflicting spaces
 	 * 4. Go to 2
	 *
	 * Assuming we work directly with arrays (not lists), and do certain things asynchronously
	 * enough, this naive approach ought to do well enough.
	 */
	
	int board_size = size; 
	int num_queens = size;
	ArrayList[Point{rank==2}] open_spots = new ArrayList[Point{rank==2}]();


	/* add all available spaces to our open spaces array */	
	for(int i = 0;i<size;i++){ /* Width */
		for(int j = 0;j<size; j++){ /* height*/
			open_spots.add(Point.make(j,i);
		}	
	}	


	return 42;


    }


   /* we'll need to be blocking out points frequently */
   public def block(point: Point{rank==2}, board: ArrayList[Point{rank==2}]){


   }
}
