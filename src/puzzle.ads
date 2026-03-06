with Sudoku_Types; use Sudoku_Types;
with Large_Square_Package;

package Puzzle is

   type Board is tagged private;

   function Create_Board return Board;

   procedure Set_Global_Square
     (Self  : in out Board;
      Row   : Sudoku_Range;
      Col   : Sudoku_Range;
      Value : Integer);

   function Get_Global_Square
     (Self : Board; Row : Sudoku_Range; Col : Sudoku_Range) return Integer;

   procedure Show_Puzzle (Self : Board);

private
   type Block_Grid is
     array (Block_Range, Block_Range) of Large_Square_Package.Instance;

   type Board is tagged record
      Blocks : Block_Grid;
   end record;

end Puzzle;
