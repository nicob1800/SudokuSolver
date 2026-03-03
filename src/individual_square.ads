package Individual_Square is

   type Position is record
      Row : Integer range 1 .. 3;
      Col : integer range 1 .. 3;
   end record;
   
   type Individual_Square is private;
   
   function Create_Square(spot : Position ; Value : Integer; Options : Possibilities) return Individual_Square

end Individual_Square;
