with Ada.Text_IO; use Ada.Text_IO;
with Sudoku_Engine; use Sudoku_Engine;
with Puzzle; use Puzzle;

procedure Sudoku_Solver is
   Entries  : String (1..11);
   Last     : Natural;
   Squares  : Integer := 0;
   My_Board : Puzzle.Board := Puzzle.Create_Board;
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

      declare
         -- Parse the 9 numbers for the current 3x3 block
         Temp_Square : Sudoku_Engine.Specific_Square := Sudoku_Engine.Parse_Square(Entries, Last);

         -- Determine the top-left starting position of this 3x3 block
         Block_Row_Start : Sudoku_Range := ((Squares - 1) / 3) * 3 + 1;
         Block_Col_Start : Sudoku_Range := ((Squares - 1) rem 3) * 3 + 1;
      begin
         for I in 1 .. 9 loop
            declare
               -- Calculate internal row/col within the block (1..3)
               Internal_R : Integer := (I - 1) / 3;
               Internal_C : Integer := (I - 1) rem 3;

               -- Calculate global 1..9 coordinates
               Global_R : Sudoku_Range := Block_Row_Start + Internal_R;
               Global_C : Sudoku_Range := Block_Col_Start + Internal_C;

               -- Get the value from the engine data structure
               Val : Integer := Temp_Square(I).Data(1);
            begin
               My_Board.Set_Global_Square(Row   => Global_R,
                                          Col   => Global_C,
                                          Value => Val);
            end;
         end loop;

         Sudoku_Engine.Show_Square(Temp_Square);
      end;
   end loop;

   -- Show the final completed 9x9 Board
   Puzzle.Show_Puzzle(My_Board);

end Sudoku_Solver;
