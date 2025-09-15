with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

private package libintl_h is

   function gettext
     (uu_msgid : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr
   with Import => True, Convention => C, External_Name => "gettext";

   function dgettext
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_msgid      : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr
   with Import => True, Convention => C, External_Name => "dgettext";

   function dcgettext
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_msgid      : Interfaces.C.Strings.chars_ptr;
      uu_category   : int) return Interfaces.C.Strings.chars_ptr
   with Import => True, Convention => C, External_Name => "dcgettext";

   function ngettext
     (uu_msgid1 : Interfaces.C.Strings.chars_ptr;
      uu_msgid2 : Interfaces.C.Strings.chars_ptr;
      uu_n      : unsigned_long) return Interfaces.C.Strings.chars_ptr
   with Import => True, Convention => C, External_Name => "ngettext";

   function dngettext
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_msgid1     : Interfaces.C.Strings.chars_ptr;
      uu_msgid2     : Interfaces.C.Strings.chars_ptr;
      uu_n          : unsigned_long) return Interfaces.C.Strings.chars_ptr
   with Import => True, Convention => C, External_Name => "dngettext";

   function dcngettext
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_msgid1     : Interfaces.C.Strings.chars_ptr;
      uu_msgid2     : Interfaces.C.Strings.chars_ptr;
      uu_n          : unsigned_long;
      uu_category   : int) return Interfaces.C.Strings.chars_ptr
   with Import => True, Convention => C, External_Name => "dcngettext";

   function textdomain
     (uu_domainname : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr
   with Import => True, Convention => C, External_Name => "textdomain";

   function bindtextdomain
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_dirname    : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr
   with Import => True, Convention => C, External_Name => "bindtextdomain";

   function bind_textdomain_codeset
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_codeset    : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr
   with
     Import => True,
     Convention => C,
     External_Name => "bind_textdomain_codeset";

end libintl_h;
