with Interfaces.C;

package Gettexts.Locale is

   type Locale_Category (<>) is tagged private;

   function Value (Self : Locale_Category) return Interfaces.C.int;

   function LC_CTYPE return Locale_Category;
   function LC_COLLATE return Locale_Category;
   function LC_MONETARY return Locale_Category;
   function LC_NUMERIC return Locale_Category;
   function LC_TIME return Locale_Category;
   function LC_MESSAGES return Locale_Category;
   function LC_ALL return Locale_Category;

   function Get_Locale (Category : Locale_Category := LC_ALL) return String;
   function Set_Locale
     (Category : Locale_Category := LC_ALL; Locale : String := "")
      return Boolean;

private

   type Locale_Category is tagged record
      Value : Interfaces.C.int;
   end record;

end Gettexts.Locale;
