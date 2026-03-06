
package body Individual_Square is
   
   type Possibilities(Max_Size : Positive) is record
      Count : Natural := 0;
      Data  : Integer_Array(1 .. Max_Size);
   end record;
   
   type Position is tagged record
      Row : Integer range 1 .. 3;
      Col : Integer range 1 .. 3;
   end record;
   
   function Create_Square(Spot : Position; Block_ID : Integer; Value : Integer; Options : Possibilities) return Instance is
   begin      
      return (Value => Value, Row => Spot.Row, Col => Spot.Col, Block_ID => Block_ID, Options => Options);
   end Create_Square;
   
   procedure Set_Value(Self : in out Instance; Value : Integer) is
   begin
      Self.Value := Value;
   end Set_Value;
   
   function Get_Value(Self : Instance) return Integer is
   begin
      return Self.Value;
   end Get_Value;
   
   procedure Modify_Possibilities(Self : in out Instance; New_Options : Possibilities) is
   begin
      Self.Options := New_Options;
   end Modify_Possibilities;
end Individual_Square;
