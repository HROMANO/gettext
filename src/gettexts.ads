limited with Gettexts.Locale;

package Gettexts is

   --  Look up 'Message_Id' in the current default message catalog for the
   --  current 'LC_MESSAGES' locale. If not found, returns 'Message_Id' itself
   --  (the default text).
   function Get_Text (Message_Id : String) return String;

   --  Same as 'Get_Text' but with a context for disambiguation.
   function Get_Text_With_Context
     (Context : String; Message_Id : String) return String;

   --  Look up 'Message_Id' in the 'Domain_Name' message catalog for the
   --  current 'LC_MESSAGES' locale.
   function Get_Text_With_Domain
     (Domain_Name : String; Message_Id : String) return String;

   --  Same as 'Get_Text_With_Domain' but with a context for disambiguation.
   function Get_Text_With_Domain_Context
     (Domain_Name : String; Context : String; Message_Id : String)
      return String;

   --  Look up 'Message_Id' in the 'Domain_Name' message catalog for the
   --  current 'Category' locale.
   function Get_Text_With_Domain_Category
     (Domain_Name : String;
      Message_Id  : String;
      Category    : Gettexts.Locale.Locale_Category) return String;

   --  Same as 'Get_Text_With_Domain_Category' but with a context for
   --  disambiguation.
   function Get_Text_With_Domain_Context_Category
     (Domain_Name : String;
      Context     : String;
      Message_Id  : String;
      Category    : Gettexts.Locale.Locale_Category) return String;

   --  Similar to 'Get_Text' but select the plural form corresponding to
   --  number 'N'.
   function Get_Plural_Text
     (Message_Id_Singular : String; Message_Id_Plural : String; N : Natural)
      return String;

   --  Same as 'Get_Plural_Text' but with a context for disambiguation.
   function Get_Plural_Text_With_Context
     (Context             : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String;

   --  Similar to 'Get_Text_With_Domain' but selects the plural form
   --  corresponding to number N.
   function Get_Plural_Text_With_Domain
     (Domain_Name         : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String;

   --  Same as 'Get_Plural_Text_With_Domain' but with a context for
   --  disambiguation.
   function Get_Plural_Text_With_Domain_Context
     (Domain_Name         : String;
      Context             : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String;

   --  Similar to 'Get_Text_With_Domain_Category' but selects the plural form
   --  corresponding to number N.
   function Get_Plural_Text_With_Domain_Category
     (Domain_Name         : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural;
      Category            : Gettexts.Locale.Locale_Category) return String;

   --  Same as 'Get_Plural_Text_With_Domain_Category' but with a context for
   --  disambiguation.
   function Get_Plural_Text_With_Domain_Context_Category
     (Domain_Name         : String;
      Context             : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural;
      Category            : Gettexts.Locale.Locale_Category) return String;

   --  Get the current default message catalog.
   function Get_Text_Domain return String;

   --  Set the current default message catalog to 'Domain_Name'.
   --  If 'Domain_Name' is "", reset to the default ("messages").
   function Set_Text_Domain (Domain_Name : String := "") return Boolean;

   --  Get the current directory for message catalog.
   function Get_Text_Domain_Directory (Domain_Name : String) return String;

   --  Specify that the 'Domain_Name' message catalog will be found
   --  in 'Directory' rather than in the system locale data base.
   function Set_Text_Domain_Directory
     (Domain_Name : String; Directory : String) return Boolean;

   --  Get the current character encoding for 'Domain_Name'.
   function Get_Text_Domain_Codeset (Domain_Name : String) return String;

   --  Specify the character encoding in which the messages from the
   --  'Domain_Name' message catalog will be returned.
   function Set_Text_Domain_Codeset
     (Domain_Name : String; Code_Set : String) return Boolean;

   ----------------------------------------------------------------------------
   --  Usual gettext names
   ----------------------------------------------------------------------------

   function gettext (Message_Id : String) return String renames Get_Text;

   function pgettext (Context : String; Message_Id : String) return String
   renames Get_Text_With_Context;

   function dgettext (Domain_Name : String; Message_Id : String) return String
   renames Get_Text_With_Domain;

   function dpgettext
     (Domain_Name : String; Context : String; Message_Id : String)
      return String renames Get_Text_With_Domain_Context;

   function dcgettext
     (Domain_Name : String;
      Message_Id  : String;
      Category    : Gettexts.Locale.Locale_Category) return String
   renames Get_Text_With_Domain_Category;

   function dcpgettext
     (Domain_Name : String;
      Context     : String;
      Message_Id  : String;
      Category    : Gettexts.Locale.Locale_Category) return String
   renames Get_Text_With_Domain_Context_Category;

   function ngettext
     (Message_Id_Singular : String; Message_Id_Plural : String; N : Natural)
      return String renames Get_Plural_Text;

   function npgettext
     (Context             : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String
   renames Get_Plural_Text_With_Context;

   function dngettext
     (Domain_Name         : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String
   renames Get_Plural_Text_With_Domain;

   function dnpgettext
     (Domain_Name         : String;
      Context             : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String
   renames Get_Plural_Text_With_Domain_Context;

   function dcngettext
     (Domain_Name         : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural;
      Category            : Gettexts.Locale.Locale_Category) return String
   renames Get_Plural_Text_With_Domain_Category;

   function dcnpgettext
     (Domain_Name         : String;
      Context             : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural;
      Category            : Gettexts.Locale.Locale_Category) return String
   renames Get_Plural_Text_With_Domain_Context_Category;

   function textdomain return String renames Get_Text_Domain;

   function textdomain (Domain_Name : String := "") return Boolean
   renames Set_Text_Domain;

   function bindtextdomain (Domain_Name : String) return String
   renames Get_Text_Domain_Directory;

   function bindtextdomain
     (Domain_Name : String; Directory : String) return Boolean
   renames Set_Text_Domain_Directory;

   function bind_textdomain_codeset (Domain_Name : String) return String
   renames Get_Text_Domain_Codeset;

   function bind_textdomain_codeset
     (Domain_Name : String; Code_Set : String) return Boolean
   renames Set_Text_Domain_Codeset;

end Gettexts;
