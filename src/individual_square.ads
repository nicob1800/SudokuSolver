package Individual_Square is
      
   type Instance is tagged private;
   
   type Position is tagged record
      Row : Integer range 1 .. 3;
      Col : integer range 1 .. 3;
   end record;
 
   
   function Create_Square(Spot : Position; Group : Large_Square; Value : Integer; Options : Possibilities) return instance;

   procedure Set_Value(Self : in out Instance; Value : Integer);
   function Get_Value(Self : Instance) return Integer;
   
   procedure Modify_Possibilities(Self : in out Instance; New_Options : Possibilities);
   
      
private

   type Instance is tagged record
      Row : Integer range 1..3;
      Col : Integer range 1..3;
      My_Group : Large_Square;
      Value : Integer := 0;
      Options : Possibilities;
   end record;
   

end Individual_Square;
