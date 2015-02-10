package body Fuzzy is




   function Membership
     (Value : in Float;
      Set : in Trapezoidal_L_Set)
      return Degree_Of_Membership
   is
   begin
      if Value < Set.Left then
	 return 0.0;
      elsif Value > Set.Right then
	 return 1.0;
      else
	 return (Value-Set.Left)/(Set.Right-Set.Left);
      end if;
   end Membership;

   ----------------
   -- Membership --
   ----------------

   function Membership
     (Value : in Float;
      Set : in Trapezoidal_R_Set)
      return Degree_Of_Membership
   is
   begin
      if Value > Set.Right then
	 return 0.0;
      elsif Value < Set.Left then
	 return 1.0;
      else
	 return (Set.Right - Value)/(Set.Right - Set.Left);
      end if;
   end Membership;

   ----------------
   -- Membership --
   ----------------

   function Membership
     (Value : in Float;
      Set : in Triangular_Set)
      return Degree_Of_Membership
   is
   begin
      if Set.Left < Value and Value <= Set.Middle then
	 return (Value - Set.Left) / (Set.Middle - Set.Left);
      elsif Set.Middle < Value and Value < Set.Right then
	return (Set.Right - Value)/(Set.Right - Set.Middle);
      else
	 return 0.0;
      end if;
   end Membership;

end Fuzzy;
