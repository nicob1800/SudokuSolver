package body Large_Square_Package is
   function Create_Large_Square(x : Integer; y : Integer) return Instance is
   begin

      return (Pos   => (Row => y, Col => x),
              Cells => (others => (others => Create_Square(Spot     => (Row => 1, Col => 1), 
                                                           Block_ID => 1, 
                                                           Value    => 0, 
                                                           Options  => (others => True)))));
   end Create_Large_Square;
end Large_Square_Package;
