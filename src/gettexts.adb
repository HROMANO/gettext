with Interfaces.C.Strings;

with Gettexts.Locale;
with libintl_h;

package body Gettexts is

   ----------------------------------------------------------------------------

   function Get_Text (Message_Id : String) return String
   is (Interfaces.C.Strings.Value
         (libintl_h.gettext (Interfaces.C.Strings.New_String (Message_Id))));

   ----------------------------------------------------------------------------

   function Particular_Get_Text
     (Context : String; Message_Id : String) return String
   is

      use type Interfaces.C.Strings.chars_ptr;

      Id          : constant Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String (Context & ASCII.EOT & Message_Id);
      Translation : constant Interfaces.C.Strings.chars_ptr :=
        libintl_h.gettext (Id);

   begin

      if Translation = Id then
         return Message_Id;
      else
         return Interfaces.C.Strings.Value (Translation);
      end if;

   end Particular_Get_Text;

   ----------------------------------------------------------------------------

   function Domain_Get_Text
     (Domain_Name : String; Message_Id : String) return String
   is (Interfaces.C.Strings.Value
         (libintl_h.dgettext
            (Interfaces.C.Strings.New_String (Domain_Name),
             Interfaces.C.Strings.New_String (Message_Id))));

   ----------------------------------------------------------------------------

   function Domain_Particular_Get_Text
     (Domain_Name : String; Context : String; Message_Id : String)
      return String
   is

      use type Interfaces.C.Strings.chars_ptr;

      Id          : constant Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String (Context & ASCII.EOT & Message_Id);
      Translation : constant Interfaces.C.Strings.chars_ptr :=
        libintl_h.dgettext (Interfaces.C.Strings.New_String (Domain_Name), Id);

   begin

      if Translation = Id then
         return Message_Id;
      else
         return Interfaces.C.Strings.Value (Translation);
      end if;

   end Domain_Particular_Get_Text;

   ----------------------------------------------------------------------------

   function Domain_Category_Get_Text
     (Domain_Name : String;
      Message_Id  : String;
      Category    : Gettexts.Locale.Locale_Category) return String
   is (Interfaces.C.Strings.Value
         (libintl_h.dcgettext
            (Interfaces.C.Strings.New_String (Domain_Name),
             Interfaces.C.Strings.New_String (Message_Id),
             Category.Value)));

   ----------------------------------------------------------------------------

   function Domain_Category_Particular_Get_Text
     (Domain_Name : String;
      Context     : String;
      Message_Id  : String;
      Category    : Gettexts.Locale.Locale_Category) return String
   is

      use type Interfaces.C.Strings.chars_ptr;

      Id          : constant Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String (Context & ASCII.EOT & Message_Id);
      Translation : constant Interfaces.C.Strings.chars_ptr :=
        libintl_h.dcgettext
          (Interfaces.C.Strings.New_String (Domain_Name), Id, Category.Value);

   begin

      if Translation = Id then
         return Message_Id;
      else
         return Interfaces.C.Strings.Value (Translation);
      end if;

   end Domain_Category_Particular_Get_Text;

   ----------------------------------------------------------------------------

   function N_Get_Text
     (Message_Id_Singular : String; Message_Id_Plural : String; N : Natural)
      return String
   is (Interfaces.C.Strings.Value
         (libintl_h.ngettext
            (Interfaces.C.Strings.New_String (Message_Id_Singular),
             Interfaces.C.Strings.New_String (Message_Id_Plural),
             Interfaces.C.unsigned_long (N))));

   ----------------------------------------------------------------------------

   function N_Particular_Get_Text
     (Context             : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String
   is

      use type Interfaces.C.Strings.chars_ptr;

      Id_Singular : constant Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String
          (Context & ASCII.EOT & Message_Id_Singular);
      Id_Plural   : constant Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String (Message_Id_Plural);
      Translation : constant Interfaces.C.Strings.chars_ptr :=
        libintl_h.ngettext
          (Id_Singular,
           Interfaces.C.Strings.New_String (Message_Id_Plural),
           Interfaces.C.unsigned_long (N));

   begin

      if Translation = Id_Singular then
         return Message_Id_Singular;
      elsif Translation = Id_Plural then
         return Message_Id_Plural;
      else
         return Interfaces.C.Strings.Value (Translation);
      end if;
   end N_Particular_Get_Text;

   ----------------------------------------------------------------------------

   function Domain_N_Get_Text
     (Domain_Name         : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String
   is (Interfaces.C.Strings.Value
         (libintl_h.dngettext
            (Interfaces.C.Strings.New_String (Domain_Name),
             Interfaces.C.Strings.New_String (Message_Id_Singular),
             Interfaces.C.Strings.New_String (Message_Id_Plural),
             Interfaces.C.unsigned_long (N))));

   ----------------------------------------------------------------------------

   function Domain_N_Particular_Get_Text
     (Domain_Name         : String;
      Context             : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural) return String
   is

      use type Interfaces.C.Strings.chars_ptr;

      Id_Singular : constant Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String
          (Context & ASCII.EOT & Message_Id_Singular);

      Id_Plural : constant Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String (Message_Id_Plural);

      Translation : constant Interfaces.C.Strings.chars_ptr :=
        libintl_h.dngettext
          (Interfaces.C.Strings.New_String (Domain_Name),
           Id_Singular,
           Interfaces.C.Strings.New_String (Message_Id_Plural),
           Interfaces.C.unsigned_long (N));
   begin

      if Translation = Id_Singular then
         return Message_Id_Singular;
      elsif Translation = Id_Plural then
         return Message_Id_Plural;
      else
         return Interfaces.C.Strings.Value (Translation);
      end if;

   end Domain_N_Particular_Get_Text;

   ----------------------------------------------------------------------------

   function Domain_Category_N_Get_Text
     (Domain_Name         : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural;
      Category            : Gettexts.Locale.Locale_Category) return String
   is (Interfaces.C.Strings.Value
         (libintl_h.dcngettext
            (Interfaces.C.Strings.New_String (Domain_Name),
             Interfaces.C.Strings.New_String (Message_Id_Singular),
             Interfaces.C.Strings.New_String (Message_Id_Plural),
             Interfaces.C.unsigned_long (N),
             Category.Value)));

   function Domain_Category_N_Particular_Get_Text
     (Domain_Name         : String;
      Context             : String;
      Message_Id_Singular : String;
      Message_Id_Plural   : String;
      N                   : Natural;
      Category            : Gettexts.Locale.Locale_Category) return String
   is

      use type Interfaces.C.Strings.chars_ptr;

      Id_Singular : constant Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String
          (Context & ASCII.EOT & Message_Id_Singular);

      Id_Plural : constant Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String (Message_Id_Plural);

      Translation : constant Interfaces.C.Strings.chars_ptr :=
        libintl_h.dcngettext
          (Interfaces.C.Strings.New_String (Domain_Name),
           Id_Singular,
           Interfaces.C.Strings.New_String (Message_Id_Plural),
           Interfaces.C.unsigned_long (N),
           Category.Value);
   begin

      if Translation = Id_Singular then
         return Message_Id_Singular;
      elsif Translation = Id_Plural then
         return Message_Id_Plural;
      else
         return Interfaces.C.Strings.Value (Translation);
      end if;

   end Domain_Category_N_Particular_Get_Text;

   ----------------------------------------------------------------------------

   function Get_Text_Domain return String
   is (Interfaces.C.Strings.Value
         (libintl_h.textdomain (Interfaces.C.Strings.Null_Ptr)));

   ----------------------------------------------------------------------------

   function Set_Text_Domain (Domain_Name : String := "") return Boolean is
      use type Interfaces.C.Strings.chars_ptr;
   begin
      if libintl_h.textdomain (Interfaces.C.Strings.New_String (Domain_Name))
        /= Interfaces.C.Strings.Null_Ptr
      then
         return True;
      else
         return False;
      end if;
   end Set_Text_Domain;

   ----------------------------------------------------------------------------

   function Get_Text_Domain_Directory (Domain_Name : String) return String
   is (Interfaces.C.Strings.Value
         (libintl_h.bindtextdomain
            (Interfaces.C.Strings.New_String (Domain_Name),
             Interfaces.C.Strings.Null_Ptr)));

   ----------------------------------------------------------------------------

   function Set_Text_Domain_Directory
     (Domain_Name : String; Directory : String) return Boolean
   is
      use type Interfaces.C.Strings.chars_ptr;
   begin
      if libintl_h.bindtextdomain
           (Interfaces.C.Strings.New_String (Domain_Name),
            Interfaces.C.Strings.New_String (Directory))
        /= Interfaces.C.Strings.Null_Ptr
      then
         return True;
      else
         return False;
      end if;
   end Set_Text_Domain_Directory;

   ----------------------------------------------------------------------------

   function Get_Text_Domain_Codeset (Domain_Name : String) return String is
      use type Interfaces.C.Strings.chars_ptr;

      Result : constant Interfaces.C.Strings.chars_ptr :=
        libintl_h.bind_textdomain_codeset
          (Interfaces.C.Strings.New_String (Domain_Name),
           Interfaces.C.Strings.Null_Ptr);
   begin
      if Result = Interfaces.C.Strings.Null_Ptr then
         return "";
      else
         return Interfaces.C.Strings.Value (Result);
      end if;
   end Get_Text_Domain_Codeset;

   ----------------------------------------------------------------------------

   function Set_Text_Domain_Codeset
     (Domain_Name : String; Code_Set : String) return Boolean
   is
      use type Interfaces.C.Strings.chars_ptr;
   begin
      if libintl_h.bind_textdomain_codeset
           (Interfaces.C.Strings.New_String (Domain_Name),
            Interfaces.C.Strings.New_String (Code_Set))
        /= Interfaces.C.Strings.Null_Ptr
      then
         return True;
      else
         return False;
      end if;
   end Set_Text_Domain_Codeset;

   ----------------------------------------------------------------------------

end Gettexts;
