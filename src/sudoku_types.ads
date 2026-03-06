package Sudoku_Types is

   subtype Sudoku_Range is Integer range 1 .. 9;

   subtype Block_Range is Integer range 1 .. 3;

   type Integer_Array is array (Positive range <>) of Integer;

   type Possibilities (Max_Size : Positive) is record
      Count : Natural := 0;
      Data  : Integer_Array (1 .. Max_Size);
   end record;

   type Position is record
      Row : Block_Range;
      Col : Block_Range;
   end record;

end Sudoku_Types;
