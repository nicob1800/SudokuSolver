with Individual_Square;
with Puzzle;
with Sudoku_Types; use Sudoku_Types;

package Sudoku_Engine is
   type Specific_Square is array (1 .. 9) of Possibilities (9);

   procedure Show_Square (Square : Specific_Square);

   function Parse_Square
     (Input : String; Last : Natural) return Specific_Square;

   procedure Assign_Answer
     (Square : in out Individual_Square.Instance; Answer : Integer);

   procedure Assign_Possibilities
     (Square : in out Individual_Square.Instance; Choices : Possibilities);

   procedure Solve (Problem : in out Puzzle.Board);

end Sudoku_Engine;
