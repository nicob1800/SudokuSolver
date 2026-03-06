with Individual_Square; use Individual_Square;
package body Large_Square_Package is
   Complete : Boolean := False;

   function Create_Large_Square(x : Integer; y : Integer) return Instance is
   begin
      return Instance'(Pos => (Row => y, Col => x));
   end Create_Large_Square;
   
    

end Large_Square_Package;
