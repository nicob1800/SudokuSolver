with Ada.Text_IO;          use Ada.Text_IO;
with Puzzle;               use Puzzle;
with Individual_Square;    use Individual_Square;
with Large_Square_Package; use Large_Square_Package;
with Sudoku_Types;         use Sudoku_Types;

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

      return Temp_Square;
   end Parse_Square;

   procedure Assign_Possibilities
     (Square : in out Individual_Square.Instance; Choices : Possibilities) is
   begin
      Square.Modify_Possibilities (Choices);
   end Assign_Possibilities;

   procedure Assign_Answer
     (Square : in out Individual_Square.Instance; Answer : Integer) is
   begin
      Square.Set_Value (Answer);
   end Assign_Answer;

   procedure Solve (Problem : in out Puzzle.Board) is
      Changed : Boolean;
   begin
      loop
         Changed := False;

         for Row in Sudoku_Range loop
            for Col in Sudoku_Range loop
               if Problem.Get_Global_Square (Row, Col) = 0 then
                  declare
                     Used     : array (1 .. 9) of Boolean := (others => False);
                     Count    : Natural := 0;
                     Last_Val : Integer := 0;

                     Block_Row_Start : constant Integer :=
                       ((Integer (Row) - 1) / 3) * 3 + 1;
                     Block_Col_Start : constant Integer :=
                       ((Integer (Col) - 1) / 3) * 3 + 1;
                  begin
                     --  Eliminate values seen in the same row
                     for C in Sudoku_Range loop
                        declare
                           V : constant Integer :=
                             Problem.Get_Global_Square (Row, C);
                        begin
                           if V /= 0 then
                              Used (V) := True;
                           end if;
                        end;
                     end loop;

                     --  Eliminate values seen in the same column
                     for R in Sudoku_Range loop
                        declare
                           V : constant Integer :=
                             Problem.Get_Global_Square (R, Col);
                        begin
                           if V /= 0 then
                              Used (V) := True;
                           end if;
                        end;
                     end loop;

                     --  Eliminate values seen in the same 3x3 block
                     for R in Block_Row_Start .. Block_Row_Start + 2 loop
                        for C in Block_Col_Start .. Block_Col_Start + 2 loop
                           declare
                              V : constant Integer :=
                                Problem.Get_Global_Square
                                  (Sudoku_Range (R), Sudoku_Range (C));
                           begin
                              if V /= 0 then
                                 Used (V) := True;
                              end if;
                           end;
                        end loop;
                     end loop;

                     --  Count remaining candidates
                     for V in 1 .. 9 loop
                        if not Used (V) then
                           Count := Count + 1;
                           Last_Val := V;
                        end if;
                     end loop;

                     --  Exactly one candidate: fill it in
                     if Count = 1 then
                        Problem.Set_Global_Square (Row, Col, Last_Val);
                        Changed := True;
                     end if;
                  end;
               end if;
            end loop;
         end loop;

         exit when not Changed;
      end loop;
   end Solve;

end Sudoku_Engine;
