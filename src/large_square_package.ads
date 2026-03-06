with Individual_Square; use Individual_Square;
package Large_Square_Package is

   type Instance is tagged private;

   type Position is tagged record
      Row : Integer range 1 .. 3;
      Col : integer range 1 .. 3;
   end record;

   type Large_Square is tagged array (1 .. 3, 1 .. 3) of Individual_Square;

   function Create_Large_Square(Spot : Position) return array(1..3, 1..3);

private
   type Grid_Array is array (1..3, 1..3) of Individual_Square.Instance
   type Instance is tagged record
      Pos   : Position;
      Cells : Grid_Array;
   end record;


end Large_Square_Package;
