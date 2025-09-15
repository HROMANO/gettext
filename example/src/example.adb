with Ada.Text_IO;
with Gettexts.Locale;

procedure Example is

   use Ada.Text_IO;

   function Tr (Item : String) return String renames Gettexts.Get_Text;
   function Ctr (Context : String; Item : String) return String
   renames Gettexts.Get_Text_With_Context;

   Domain : constant String := "example";

begin

   New_Line;

   --  Set locale

   Put_Line ("Locale at start = " & Gettexts.Locale.Get_Locale);

   if Gettexts.Locale.Set_Locale then
      Put ("Set_Locale success: ");
   else
      Put ("Set_Locale failure: ");
   end if;

   Put_Line ("Locale = " & Gettexts.Locale.Get_Locale);

   --  Set text domain directory

   New_Line;

   Put_Line
     ("Text domain directory at start = "
      & Gettexts.Get_Domain_Directory (Domain));

   if Gettexts.Set_Domain_Directory (Domain, "share/locale/") then
      Put ("Set_Text_Domain_Directory success: ");
   else
      Put ("Set_Text_Domain_Directory failure: ");
   end if;

   Put_Line
     ("Text domain directory = " & Gettexts.Get_Domain_Directory (Domain));

   --  Set domain

   New_Line;

   Put_Line ("Text domain at start = " & Gettexts.Get_Domain_Name);

   if Gettexts.Set_Domain_Name (Domain) then
      Put ("Set_Text_Domain success: ");
   else
      Put ("Set_Text_Domain failure: ");
   end if;

   Put_Line ("Text_domain = " & Gettexts.Get_Domain_Name);

   --  Set codeset

   New_Line;

   Put_Line ("Codeset at start = " & Gettexts.Get_Domain_Codeset (Domain));

   if Gettexts.Set_Domain_Codeset (Domain, "utf8") then
      Put ("Set_Text_Domain_Codeset success: ");
   else
      Put ("Set_Text_Domain_Codeset failure: ");
   end if;

   Put_Line ("Codeset = " & Gettexts.Get_Domain_Codeset (Domain));

   --  Translate

   New_Line;

   Put_Line (Tr ("Translation: 'This is an example' = 'This is an example'"));

   --  Translate with context

   New_Line;

   Put_Line (Ctr ("Context", "An example"));

   Put_Line (Ctr ("Other", "An example"));

end Example;
