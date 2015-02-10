With Ada.Text_IO;
With Ada.Float_Text_IO;
package body Iris is

   function Classify (A : in Iris) return Iris_Class is
   begin
      return Versicolor;
   end Classify;

   procedure Normalize (A : in out Iris_Array) is
   begin
      for E of A loop
	 E.Sepal.Width := (E.Sepal.Width - Min_Sepal_Width) / (Max_Sepal_Width - Min_Sepal_Width);
	 E.Sepal.Length := (E.Sepal.Length - Min_Sepal_Length) / (Max_Sepal_Length - Min_Sepal_Length);
	 E.Petal.Width := (E.Petal.Width - Min_Petal_Width) / (Max_Petal_Width - Min_Petal_Width);
	 E.Petal.Length := (E.Petal.Length - Min_Petal_Length) / (Max_Petal_Length-Min_Petal_Length);
      end loop;
   end Normalize;

   procedure put (A : in Iris_Class) is
   begin
      Ada.Text_IO.Put(Iris_Class'Image ( A ));
   end put;

   procedure put (A : in Iris) is
   begin
      Ada.Float_Text_IO.Put(A.Sepal.Length, 2,1,0);
      Ada.Float_Text_IO.Put (A.Sepal.Width, 2, 1, 0);
      Ada.Float_Text_IO.Put (A.Petal.Length, 2, 1, 0);
      Ada.Float_Text_IO.Put(A.Petal.Width, 2,1,0);
      Ada.Text_IO.Put (" ");
      Put (A.Class);
      Ada.Text_IO.Put (" -> ");
      Put(A.Guess);
      Ada.Text_IO.New_Line;
   end put;

   procedure put (A : in Iris_Array) is
   begin
      for E of A loop
         put(E);
      end loop;
   end put;

end Iris;
