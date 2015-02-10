Package Fuzzy is
   subtype Degree_Of_Membership is Float range 0.0 .. 1.0;

   type Trapezoidal_R_Set is record
      Left : Float;
      Right : Float;
   end record;

   type Trapezoidal_L_Set is record
      Left : Float;
      Right : Float;
   end record;

   type Triangular_Set is record
      Left : Float;
      Middle : Float;
      Right : Float;
   end record;

   function Membership (Value : in Float; Set : in Trapezoidal_L_Set) return Degree_Of_Membership;
   function Membership (Value : in Float; Set : in Trapezoidal_R_Set) return Degree_Of_Membership;
   function Membership (Value : in Float; Set : in Triangular_Set) return Degree_Of_Membership;
end Fuzzy;
