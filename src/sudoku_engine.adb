with Ada.Text_IO;          use Ada.Text_IO;
with Puzzle;               use Puzzle;
with Individual_Square;    use Individual_Square;
with Large_Square_Package; use Large_Square_Package;
with Sudoku_Engine;        use Sudoku_Engine;

package body Sudoku_Engine is

   procedure Show_Row (Square : Specific_Square; Row_Number : Integer) is
   begin
      Put ("[");
      for I in 3 * Row_Number - 2 .. 3 * Row_Number loop
         if Square (I).Count = 1 then
            declare
               -- Convert to string, e.g., " 5"

               Img : String := Integer'Image (Square (I).Data (1));
            begin
               Put (Img (2 .. Img'Last));
            end;
         else
            Put ("_");
         end if;

         if I rem 3 = 0 then
            Put ("] ");
         else
            Put ("|");
         end if;
      end loop;
   end Show_Row;

   procedure Show_Square (Square : Specific_Square) is
   begin

      for I in 1 .. 9 loop
         if I rem 3 = 1 then
            Put ("[ ");
         end if;

         if Square (I).Count = 1 then
            Put (Integer'Image (Square (I).Data (1)) & " ");
         else
            Put (" _ ");
         end if;

         if I rem 3 = 0 then
            Put (" ]");
            New_Line;
         else
            Put (" | ");
         end if;

      end loop;
   end Show_Square;

   function Parse_Square
     (Input : String; Last : Natural) return Specific_Square
   is
      Temp_Square : Specific_Square;
   begin
      for I in 1 .. 9 loop
         if I <= Last and then Input (I) in '1' .. '9' then
            declare
               Val : Integer :=
                 Character'Pos (Input (I)) - Character'Pos ('0');
            begin
               Temp_Square (I) :=
                 (Max_Size => 9, Count => 1, Data => (1 => Val, others => 0));
            end;
         else
            Temp_Square (I) :=
              (Max_Size => 9, Count => 9, Data => (1, 2, 3, 4, 5, 6, 7, 8, 9));
         end if;
      end loop;

      return Temp_Square; -- Send the finished square back to the main program
   end Parse_Square;

   procedure Assign_Possibilities
     (Square : in out Individual_Square; Choices : Possibilities) is
   begin
      Square.Possibilities := Choices;
   end Assign_Possibilities;

   procedure Assign_Answer
     (Square : in out Individual_Square; Answer : Integer) is
   begin
      if Square.Possibilities.Count = 1 then
         Square.Value := Answer;
      end if;
   end Assign_Answer;

   procedure Solve (Problem : in out Puzzle) is
   begin

   end Solve;

end Sudoku_Engine;
