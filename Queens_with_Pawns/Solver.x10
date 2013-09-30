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
			val pt : Point{rank==2} = [j,i];
			open_spots.add(pt);
		}	
	}
	
	/* Block pawn spaces */
	while(pawns.size() > 0){
		block(pawns.get(0), open_spots);
		pawns.removeFirst();
	}

	
	if(open_spots.size()>0){
		val col_to_place : int = open_spots.get(0)(1) as Int;	
		val count : int = place(col_to_place, open_spots, num_queens);
		return count;
	}
	return 0n;
    }

    /** Place a queen asynchronously in each of the spaces free in the first column (-,x) */
    public def place(column: int, board:ArrayList[Point{rank==2}], queens:int) : int 
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

	var count:int = 0n;	
	var num_queens:int = queens;	

 	for(var i:int = 0n;i<board.size();i++){
		// Verify that we're only going to attempt to place
		// queens in the col_to_place
		if(column == board.get(i)(1) as Int){
		//Asynchronously place queen with a copy of the board
			val new_board : ArrayList[Point{rank==2}];  // Arraylist of currently open points
			new_board = board.clone();	
			//Console.OUT.println("orig: \n" + new_board);
			block_queen(board.get(i), new_board);
			//Console.OUT.println("new: \n" + new_board);
			Console.OUT.println("Q's :" + queens);
			Console.OUT.println("C :" + count);
			if(num_queens==0n){
				return 1n;
 			}
			count += place(column+1n,new_board,num_queens-1n);
			Console.OUT.println("C :" + count);
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
	val pt: Point{rank==2} = [-1n,-2n];
        for(var i:Int = 0n; i < board.size(); i++) {
		Console.OUT.println(board.get(i)(0) + "," +board.get(i)(1) + "   :::   "  + point(0) + "," +point(1));
		if(board.get(i)(0).equals(point(0))||board.get(i)(1).equals(point(1))||(board.get(i)(0).equals((point(0)+i)) && board.get(i)(1).equals((point(1)+i)))||(board.get(i)(0).equals((point(0)-i)) && board.get(i)(1).equals((point(1)+i)))||(board.get(i)(0).equals((point(0)+i)) && board.get(i)(1).equals((point(1)-i)))||(board.get(i)(0).equals((point(0)-i)) && board.get(i)(1).equals((point(1)-i)))){
			board.set(pt,i);	
		}
	}
	while(board.remove(pt)){continue;}
    }

}
