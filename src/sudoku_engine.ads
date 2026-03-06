with Sudoku_Types; use Sudoku_Types;

package Sudoku_Engine is
   type Specific_Square is array(1..9) of Possibilities(9);
   
   procedure Show_Square(Square : Specific_Square);
   
   -- OR take a generic parameter to avoid a 'with' loop.
   function Parse_Square(Input : String; Last : Natural) return Specific_Square;
end Sudoku_Engine;
