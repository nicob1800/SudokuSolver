with Ada.Text_IO; use Ada.Text_IO;

procedure Sudoku_Solver is


   type Integer_Array is array (Positive range <>) of Integer;
   type Possibilities(Max_Size : Positive) is record
                      Count : Natural := 0;
                      Data  : Integer_Array(1 .. Max_Size);
                      end record;
   type Specific_Square is array(1..9) of Possibilities(9);
   --type Square_Array is array(1..9) of Specific_Square;
   type Puzzle_Array is array(1..9) of Specific_Square;

   Entries : String (1..11);
   Current_Square : Specific_Square;
   Last : Natural;
   Squares : Integer := 0;
   Puzzle : Puzzle_Array;

   procedure Show_Square(Square : Specific_Square) is
   begin

      for I in 1 .. 9 loop
         if I rem 3 = 1 then
            Put("[ ");
         end if;

         if Square(I).Count = 1 then
            Put(Integer'Image(Square(I).Data(1)) & " ");
         else
            Put(" · ");
         end if;

         if I rem 3 = 0 then
            Put(" ]");
            New_Line;
         else
            Put(" | ");
         end if;

      end loop;
   end Show_Square;

   procedure Show_Row(Square : Specific_Square; Row_Number : Integer) is
   begin
     Put("[");
      for I in 3*Row_Number-2 .. 3*Row_Number loop
         if Square(I).Count = 1 then
            declare
               -- Convert to string, e.g., " 5"

               Img : String := Integer'Image(Square(I).Data(1));
            begin
               Put(Img(2 .. Img'Last));
            end;
         else
            Put("·");
         end if;

         if I rem 3 = 0 then
            Put("] ");
         else
            Put("|");
         end if;
      end loop;
   end Show_Row;


   procedure Show_Puzzle(Puzzle : Puzzle_Array) is
      y : Integer := 1; --Square
   begin
      Put_Line(" _____________________________________");
      for I in 1..3 loop
         for J in 1..3 loop
            for Square of Puzzle(3*I-2 .. 3*I) loop
               y := y+1;
               Show_Row(Square, J);
            end loop;
            New_Line;
         end loop;
         New_Line;
      end loop;
   end Show_Puzzle;


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

      get_Line(Entries, Last);

      --exit when Last = 0;

      exit when Entries(1) = 'q';

      for I in 1 .. Last loop
         if I rem 3 = 1 then
            if Entries(I) = '_' then
               Current_Square(I) := (Max_Size => 9,
                                  Count    => 9,
                                  Data     => (1, 2, 3, 4, 5, 6, 7, 8, 9));
            else
               declare
                  Val : Integer := Character'Pos(Entries(I)) - Character'Pos('0');
               begin
                  Current_Square(I) := (Max_Size => 9,
                                        Count    => 1,
                                        Data     => (1 => Val, others => 0));
               end;
            end if;

         else

            if Entries(I) = '_' then
               Current_Square(I) := (Max_Size => 9,
                                     Count    => 9,
                                     Data     => (1, 2, 3, 4, 5, 6, 7, 8, 9));
            else
               declare
                  Val : Integer := Character'Pos(Entries(I)) - Character'Pos('0');
               begin
                  Current_Square(I) := (Max_Size => 9,
                                        Count    => 1,
                                        Data     => (1 => Val, others => 0));
               end;
            end if;

         end if;

      end loop;

      Puzzle(Squares) := Current_Square;
      Show_Square(Current_Square);

   end loop;

   Show_Puzzle(Puzzle);

   null;
end Sudoku_Solver;
