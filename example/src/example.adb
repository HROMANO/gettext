with Ada.Text_IO;
with Gettext.Locale;

procedure Example is

   use Ada.Text_IO;

   function tr (Item : String) return String renames Gettext.Get_Text;

   Domain : constant String := "example";

begin

   New_Line;

   --  Set locale

   Put_Line ("Locale at start = " & Gettext.Locale.Get_Locale);

   if Gettext.Locale.Set_Locale then
      Put ("Set_Locale success: ");
   else
      Put ("Set_Locale failure: ");
   end if;

   Put_Line ("Locale = " & Gettext.Locale.Get_Locale);

   --  Set text domain directory

   New_Line;

   Put_Line
     ("Text domain directory at start = "
      & Gettext.Get_Text_Domain_Directory (Domain));

   if Gettext.Set_Text_Domain_Directory (Domain, "share/locale/") then
      Put ("Set_Text_Domain_Directory success: ");
   else
      Put ("Set_Text_Domain_Directory failure: ");
   end if;

   Put_Line
     ("Text domain directory = " & Gettext.Get_Text_Domain_Directory (Domain));

   --  Set domain

   New_Line;

   Put_Line ("Text domain at start = " & Gettext.Get_Text_Domain);

   if Gettext.Set_Text_Domain (Domain) then
      Put ("Set_Text_Domain success: ");
   else
      Put ("Set_Text_Domain failure: ");
   end if;

   Put_Line ("Text_domain = " & Gettext.Get_Text_Domain);

   --  Set codeset

   New_Line;

   Put_Line ("Codeset at start = " & Gettext.Get_Text_Domain_Codeset (Domain));

   if Gettext.Set_Text_Domain_Codeset (Domain, "utf8") then
      Put ("Set_Text_Domain_Codeset success: ");
   else
      Put ("Set_Text_Domain_Codeset failure: ");
   end if;

   Put_Line ("Codeset = " & Gettext.Get_Text_Domain_Codeset (Domain));

   --  Translate

   New_Line;

   Put_Line (tr ("Translation: 'This is an example' = 'This is an example'"));

end Example;
