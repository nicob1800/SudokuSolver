with Sudoku_Types; use Sudoku_Types;

package body Large_Square_Package is
   function Create_Large_Square (x : Integer; y : Integer) return Instance is
      Result : Instance;
      ID     : Integer := (y - 1) * 3 + x;
   begin
      Result.Pos := (Row => y, Col => x);
      for R in 1 .. 3 loop
         for C in 1 .. 3 loop
            Result.Cells (R, C) := Create_Square ((Row => R, Col => C), ID, 0);
         end loop;
      end loop;
      return Result;
   end Create_Large_Square;

   procedure Set_Cell_Value
     (Self : in out Instance; Row, Col : Integer; Value : Integer) is
   begin
      Self.Cells (Row, Col).Set_Value (Value);
   end Set_Cell_Value;

   function Get_Cell_Value (Self : Instance; Row, Col : Integer) return Integer
   is
   begin
      return Self.Cells (Row, Col).Get_Value;
   end Get_Cell_Value;
end Large_Square_Package;
