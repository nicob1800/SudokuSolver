package Sudoku_Engine is

   type Integer_Array is array (Positive range <>) of Integer;
   type Possibilities(Max_Size : Positive) is record
                      Count : Natural := 0;
                      Data  : Integer_Array(1 .. Max_Size);
                      end record;
   type Specific_Square is array(1..9) of Possibilities(9);
   type Puzzle_Array is array(1..9) of Specific_Square;
   
   procedure Show_Square(Square : Specific_Square);
   procedure Show_Row(Square : Specific_Square; Row_Number : Integer);
   procedure Show_Puzzle(Puzzle : Puzzle_Array);
   function Parse_Square(Input : String; Last : Natural) return Specific_Square;
   
   
   
end Sudoku_Engine;
