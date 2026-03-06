with Individual_Square; use Individual_Square;

package Large_Square_Package is
   type Instance is tagged private;

   type Integer_Array is array (Positive range <>) of Integer;

   type Possibilities(Max_Size : Positive) is record
      Count : Natural := 0;
      Data  : Integer_Array(1 .. Max_Size);
   end record;


   function Create_Large_Square(x : Integer; y : Integer) return Instance;

   procedure Set_Cell_Value(Self : in out Instance; Row, Col : Integer; Value : Integer);
   function Get_Cell_Value(Self : Instance; Row, Col : Integer) return Integer;

private
   type Grid_Array is array (1 .. 3, 1 .. 3) of Individual_Square.Instance;
   type Instance is tagged record
      Pos   : Position;
      Cells : Grid_Array;
   end record;
end Large_Square_Package;
