package body Iris.File_Reader is

   procedure Read_File (Filename : in String; Destination : out Iris_Array) is
      File       : Ada.Text_IO.File_Type;
      Line_Count : Natural := 1;
   begin
      Ada.Text_IO.Open (File => File,
                        Mode => Ada.Text_IO.In_File,
                        Name => Filename);

      while not Ada.Text_IO.End_Of_File (File) loop
         declare
            Line : String := Ada.Text_IO.Get_Line (File);
         begin
            Destination(Line_Count) := Extract_Line(Line);
            Line_Count := Line_Count + 1;
         end;
      end loop;
      Ada.Text_IO.Close (File);
   end Read_File;


   function Extract_Line(Line : in String) return Iris is
      Ir : Iris;
      Index_List : array(Line'Range) of Natural;
      Next_Index : Integer := Index_List'First;
      column : Natural := 1;
   begin
      Index_List(Next_Index) := Line'First;

      while Index_List(Next_Index) < Line'Last loop
         Next_Index := Next_Index + 1;
         Index_List(Next_Index) := 1 + Index(Line(Index_List(Next_Index - 1)..Line'Last), ",");
         if Index_List(Next_Index) = 1 then
            Index_List(Next_Index) := Line'Last + 2;
         end if;

         declare
            s : String := Ada.Strings.Fixed.Translate(Line(Index_List(Next_Index - 1)..Index_List(Next_Index)-2),
     Ada.Strings.Maps.Constants.Upper_Case_Map);
         begin
            case column is
               when 1 => Ir.Sepal.Length := Float'value(s);
               when 2 => Ir.Sepal.Width := Float'value(s);
               when 3 => Ir.Petal.Length := Float'value(s);
               when 4 => Ir.Petal.Width := Float'value(s);
               when others =>
                if s = Iris_Class'Image(Setosa) then
                  Ir.Class := Setosa;
                elsif s = Iris_Class'Image(Versicolor) then
                  Ir.Class := Versicolor;
                else
                  Ir.Class := Virginica;
                end if;
               column := 0;
            end case;
         end;
         column := column + 1;
      end loop;

      return Ir;
   end;


end Iris.File_Reader;
