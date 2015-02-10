Package Iris is

   --Statistics
   Min_Sepal_Length : constant Float := 4.3;
   Min_Sepal_Width  : constant Float := 2.0;
   Min_Petal_Length : constant Float := 1.0;
   Min_Petal_Width  : constant Float := 0.1;
   Max_Sepal_Length : constant Float := 7.9;
   Max_Sepal_Width  : constant Float := 4.4;
   Max_Petal_Length : constant Float := 6.9;
   Max_Petal_Width  : constant Float := 2.5;

   Type Iris_Class is (Setosa, Versicolor, Virginica);

   Type Etal is record
      Width : Float := 0.0;
      Length : Float := 0.0;
   end record;

   Type Iris is record
      Sepal : Etal;
      Petal : Etal;
      Class : Iris_Class;
      Guess : Iris_Class;
   end record;

   Type Iris_Array is array(Positive range<>) of Iris;
   Type Float_Array is array (Positive range<>) of Float;

   procedure Put (A : in Iris);
   procedure Put (A : in Iris_Array);
   procedure Put(A : in Iris_Class);
   procedure Normalize (A : in out Iris_Array);
   function Classify (A : in Float_Array) return Iris_Class;
   function Max(A:in Float_Array) return Float;

End Iris;
