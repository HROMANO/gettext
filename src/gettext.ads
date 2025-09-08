limited with Gettext.Locale;

package Gettext is

   --  Look up 'Message_Id' in the current default message catalog for the
   --  current LC_MESSAGES locale. If not found, returns 'Message_Id' itself
   --  (the default text).
   function Get_Text (Message_Id : String) return String;

   --  Look up 'Message_Id' in the 'Domain_Name' message catalog for the
   --  current LC_MESSAGES locale.
   function Domain_Get_Text
     (Domain_Name : String; Message_Id : String) return String;

   --  Look up 'Message_Id' in the 'Domain_Name' message catalog for the
   --  current 'Category' locale.
   function Domain_Category_Get_Text
     (Domain_Name : String;
      Message_Id  : String;
      Category    : Gettext.Locale.Locale_Category) return String;

   --  Similar to 'Get_Text' but select the plural form corresponding to the
   --  number N.
   function N_Get_Text
     (Message_Id1 : String; Message_Id2 : String; N : Natural) return String;

   --  Similar to 'Domain_Get_Text' but select the plural form corresponding
   --  to the number N.
   function Domain_N_Get_Text
     (Domain_Name         : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String;

   --  Similar to 'Domain_Category_Get_Text' but select the plural form
   --  corresponding to the number N.
   function Domain_Category_N_Get_Text
     (Domain_Name         : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural;
      Category            : Gettext.Locale.Locale_Category) return String;

   --  Get the current default message catalog.
   function Get_Text_Domain return String;

   --  Set the current default message catalog to 'Domain_Name'.
   --  If 'Domain_Name' is "", reset to the default of "messages".
   function Set_Text_Domain (Domain_Name : String := "") return Boolean;

   --  Get the current directory for message catalog.
   function Get_Text_Domain_Directory (Domain_Name : String) return String;

   --  Specify that the 'Domain_Name' message catalog will be found
   --  in 'Directory' rather than in the system locale data base.
   function Set_Text_Domain_Directory
     (Domain_Name : String; Directory : String) return Boolean;

   function Get_Text_Domain_Codeset (Domain_Name : String) return String;

   --  Specify the character encoding in which the messages from the
   --  'Domain_Name' message catalog will be returned.
   function Set_Text_Domain_Codeset
     (Domain_Name : String; Code_Set : String) return Boolean;

end Gettext;
