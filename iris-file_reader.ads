with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Maps;
with Ada.Strings.Maps.Constants;

Package Iris.File_Reader is
   Procedure Read_File(Filename : in String; Destination : out Iris_Array);
   function Extract_Line(Line : in String) return Iris;
end Iris.File_Reader;
