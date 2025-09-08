with Interfaces.C.Strings;

package body Gettext.Locale is

   ----------------------------------------------------------------------------

   function LC_CTYPE return Locale_Category is

      function internal return Interfaces.C.int
      with Import => True, Convention => C, External_Name => "ada_ctype";

   begin
      return Locale_Category (internal);
   end LC_CTYPE;

   ----------------------------------------------------------------------------

   function LC_COLLATE return Locale_Category is

      function internal return Interfaces.C.int
      with Import => True, Convention => C, External_Name => "ada_ctype";

   begin
      return Locale_Category (internal);
   end LC_COLLATE;

   ----------------------------------------------------------------------------

   function LC_MONETARY return Locale_Category is

      function internal return Interfaces.C.int
      with Import => True, Convention => C, External_Name => "ada_ctype";

   begin
      return Locale_Category (internal);
   end LC_MONETARY;

   ----------------------------------------------------------------------------

   function LC_NUMERIC return Locale_Category is

      function internal return Interfaces.C.int
      with Import => True, Convention => C, External_Name => "ada_ctype";

   begin
      return Locale_Category (internal);
   end LC_NUMERIC;

   ----------------------------------------------------------------------------

   function LC_TIME return Locale_Category is

      function internal return Interfaces.C.int
      with Import => True, Convention => C, External_Name => "ada_ctype";

   begin
      return Locale_Category (internal);
   end LC_TIME;

   ----------------------------------------------------------------------------

   function LC_MESSAGES return Locale_Category is

      function internal return Interfaces.C.int
      with Import => True, Convention => C, External_Name => "ada_ctype";

   begin
      return Locale_Category (internal);
   end LC_MESSAGES;

   ----------------------------------------------------------------------------

   function LC_ALL return Locale_Category is

      function internal return Interfaces.C.int
      with Import => True, Convention => C, External_Name => "ada_all";

   begin
      return Locale_Category (internal);
   end LC_ALL;

   ----------------------------------------------------------------------------

   function Get_Locale (Category : Locale_Category := LC_ALL) return String is

      function internal
        (category : Interfaces.C.int; locale : Interfaces.C.Strings.chars_ptr)
         return Interfaces.C.Strings.chars_ptr
      with Convention => C, Import => True, External_Name => "setlocale";

   begin
      return
        Interfaces.C.Strings.Value
          (internal
             (Interfaces.C.int (Category), Interfaces.C.Strings.Null_Ptr));
   end Get_Locale;

   ----------------------------------------------------------------------------

   function Set_Locale
     (Category : Locale_Category := LC_ALL; Locale : String := "")
      return Boolean
   is

      use type Interfaces.C.Strings.chars_ptr;

      function internal
        (category : Interfaces.C.int; locale : Interfaces.C.Strings.chars_ptr)
         return Interfaces.C.Strings.chars_ptr
      with Convention => C, Import => True, External_Name => "setlocale";

      Result : Interfaces.C.Strings.chars_ptr :=
        internal
          (Interfaces.C.int (Category),
           Interfaces.C.Strings.New_String (Locale));

   begin
      if Result /= Interfaces.C.Strings.Null_Ptr then
         return True;
      else
         return False;
      end if;
   end Set_Locale;

end Gettext.Locale;
