with Individual_Square; use Individual_Square;
with Sudoku_Types;      use Sudoku_Types;

package Large_Square_Package is
   type Instance is tagged private;

   type Integer_Array is array (Positive range <>) of Integer;

   function Create_Large_Square (x : Integer; y : Integer) return Instance;

   procedure Set_Cell_Value
     (Self : in out Instance; Row, Col : Integer; Value : Integer);
   function Get_Cell_Value
     (Self : Instance; Row, Col : Integer) return Integer;

private
   type Grid_Array is array (1 .. 3, 1 .. 3) of Individual_Square.Instance;
   type Instance is tagged record
      Pos   : Sudoku_Types.Position;
      Cells : Grid_Array;
   end record;
end Large_Square_Package;
