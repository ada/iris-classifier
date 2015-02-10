with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Iris;              use Iris;
with Iris.File_Reader;
with Fuzzy;             use Fuzzy;

procedure Main is
   Set_Short  : Trapezoidal_R_Set := (Left => 0.0, Right  => 0.6);
   Set_Middle : Triangular_Set    := (Left => 0.0, Middle => 0.6, Right => 1.0);
   Set_Long   : Trapezoidal_L_Set := (Left => 0.6, Right  => 1.0);
   Iris_Set   : Iris_Array(1 .. 150);
begin
   File_Reader.Read_File ("iris.txt", Iris_Set);
   Normalize (Iris_Set);
   Put(Iris_Set);
   for A of Iris_Set loop
      declare
	 x1 : Float := A.Sepal.Length;
	 x2 : Float := A.Sepal.Width;
	 x3 : Float := A.Petal.Length;
	 x4 : Float := A.Petal.Width;

	 Short_x1  : Degree_Of_Membership := Membership (x1, Set_Short);
	 Middle_x1 : Degree_Of_Membership := Membership (x1, Set_Middle);
	 Long_x1   : Degree_Of_Membership := Membership (x1, Set_Long);

	 Short_x2  : Degree_Of_Membership := Membership (x2, Set_Short);
	 Middle_x2 : Degree_Of_Membership := Membership (x2, Set_Middle);
	 Long_x2   : Degree_Of_Membership := Membership (x2, Set_Long);

	 Short_x3  : Degree_Of_Membership := Membership (x3, Set_Short);
	 Middle_x3 : Degree_Of_Membership := Membership (x3, Set_Middle);
	 Long_x3   : Degree_Of_Membership := Membership (x3, Set_Long);

	 Short_x4  : Degree_Of_Membership := Membership (x4, Set_Short);
	 Middle_x4 : Degree_Of_Membership := Membership (x4, Set_Middle);
	 Long_x4   : Degree_Of_Membership := Membership (x4, Set_Long);

      begin
	 if x3 = Union(short_x3, middle_x3) and x4 = short_x4 then
	    A.Guess := Setosa;
	    Put (A);
	 end if;
      end;
   end loop;


end Main;
