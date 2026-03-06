with Ada.Text_IO;          use Ada.Text_IO;
with Large_Square_Package; use Large_Square_Package;
with Sudoku_Types;         use Sudoku_Types;

package body Puzzle is

   function To_Block_Index (Global : Sudoku_Range) return Block_Range is
   begin
      return Block_Range (((Global - 1) / 3) + 1);
   end To_Block_Index;

   function To_Cell_Index (Global : Sudoku_Range) return Integer is
   begin
      return ((Global - 1) rem 3) + 1;
   end To_Cell_Index;

   function Create_Board return Board is
      Result : Board;
   begin
      for Block_Row in Block_Range loop
         for Block_Col in Block_Range loop
            Result.Blocks (Block_Row, Block_Col) :=
              Create_Large_Square (Integer (Block_Col), Integer (Block_Row));
         end loop;
      end loop;
      return Result;
   end Create_Board;

   procedure Set_Global_Square
     (Self  : in out Board;
      Row   : Sudoku_Range;
      Col   : Sudoku_Range;
      Value : Integer)
   is
      Block_Row : constant Block_Range := To_Block_Index (Row);
      Block_Col : constant Block_Range := To_Block_Index (Col);
      Cell_Row  : constant Integer := To_Cell_Index (Row);
      Cell_Col  : constant Integer := To_Cell_Index (Col);
   begin
      Self.Blocks (Block_Row, Block_Col).Set_Cell_Value
        (Row => Cell_Row, Col => Cell_Col, Value => Value);
   end Set_Global_Square;

   function Get_Global_Square
     (Self : Board; Row : Sudoku_Range; Col : Sudoku_Range) return Integer
   is
      Block_Row : constant Block_Range := To_Block_Index (Row);
      Block_Col : constant Block_Range := To_Block_Index (Col);
      Cell_Row  : constant Integer := To_Cell_Index (Row);
      Cell_Col  : constant Integer := To_Cell_Index (Col);
   begin
      return
        Self.Blocks (Block_Row, Block_Col).Get_Cell_Value (Cell_Row, Cell_Col);
   end Get_Global_Square;

   procedure Show_Puzzle (Self : Board) is
   begin
      Put_Line ("______________________");
      for Block_Row in Block_Range loop
         for Row_Within_Block in 1 .. 3 loop
            for Block_Col in Block_Range loop
               Put ("[");
               for Col_Within_Block in 1 .. 3 loop
                  declare
                     Global_Row : constant Sudoku_Range :=
                       Sudoku_Range
                         ((Integer (Block_Row) - 1) * 3 + Row_Within_Block);
                     Global_Col : constant Sudoku_Range :=
                       Sudoku_Range
                         ((Integer (Block_Col) - 1) * 3 + Col_Within_Block);
                     Value      : constant Integer :=
                       Get_Global_Square (Self, Global_Row, Global_Col);
                  begin
                     if Value = 0 then
                        Put ("_");
                     else
                        Put (Integer'Image (Value) (2 .. 2));
                     end if;

                     if Col_Within_Block < 3 then
                        Put ("|");
                     end if;
                  end;
               end loop;
               Put ("] ");
            end loop;
            New_Line;
         end loop;

         if Block_Row < 3 then
            New_Line;
         end if;
      end loop;
   end Show_Puzzle;

end Puzzle;
