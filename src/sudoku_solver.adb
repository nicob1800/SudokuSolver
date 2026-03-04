with Ada.Text_IO; use Ada.Text_IO;
with Sudoku_Engine; use Sudoku_Engine;
procedure Sudoku_Solver is

   Entries        : String (1..11);
   Last           : Natural;
   Squares        : Integer := 0;
   Puzzle         : Puzzle_Array;

begin

   Put_Line("Array of Square is: ");
   Put_Line("_______");
   Put_Line("|1|2|3|");
   Put_Line("|4|5|6|");
   Put_Line("|7|8|9|");
   Put_Line("¯¯¯¯¯¯¯");

   loop
      Squares := Squares + 1;
      exit when Squares = 10;

      Put_line ("Square " & Integer'Image(Squares));
      Get_Line(Entries, Last);
      exit when Entries(1) = 'q';

      Puzzle(Squares) := Parse_Square(Entries, Last);
      Show_Square(Puzzle(Squares));
   end loop;


   Show_Puzzle(Puzzle);




end Sudoku_Solver;


















