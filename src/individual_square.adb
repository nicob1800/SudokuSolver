package body Individual_Square is

   function Create_Square
     (Spot     : Position;
      Block_ID : Integer;
      Value    : Integer;
      Options  : Possibilities) return Instance is
   begin
      return
        (Value    => Value,
         Row      => Spot.Row,
         Col      => Spot.Col,
         Block_ID => Block_ID,
         Options  => Options);
   end Create_Square;

   function Create_Square
     (Spot : Position; Block_ID : Integer; Value : Integer) return Instance
   is
      Default_Options : constant Possibilities (9) :=
        (Max_Size => 9, Count => 9, Data => (1, 2, 3, 4, 5, 6, 7, 8, 9));
   begin
      return Create_Square (Spot, Block_ID, Value, Default_Options);
   end Create_Square;

   procedure Set_Value (Self : in out Instance; Value : Integer) is
   begin
      Self.Value := Value;
   end Set_Value;

   function Get_Value (Self : Instance) return Integer is
   begin
      return Self.Value;
   end Get_Value;

   procedure Modify_Possibilities
     (Self : in out Instance; New_Options : Possibilities) is
   begin
      Self.Options := New_Options;
   end Modify_Possibilities;
end Individual_Square;
