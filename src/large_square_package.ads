with Individual_Square; use Individual_Square;

package Large_Square_Package is
   type Instance is tagged private;

   type Position is tagged record
      Row : Integer range 1 .. 3;
      Col : Integer range 1 .. 3;
   end record;

   -- Fixed return type to match Instance
   function Create_Large_Square(x : Integer; y : Integer) return Instance;

private
   type Grid_Array is array (1 .. 3, 1 .. 3) of Individual_Square.Instance;
   type Instance is tagged record
      Pos   : Position;
      Cells : Grid_Array;
   end record;
end Large_Square_Package;
