pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

private package libintl_h is

   -- Message catalogs for internationalization.
   --   Copyright (C) 1995-2023 Free Software Foundation, Inc.
   --   This file is part of the GNU C Library.
   --   This file is derived from the file libgettext.h in the GNU gettext package.
   --   The GNU C Library is free software; you can redistribute it and/or
   --   modify it under the terms of the GNU Lesser General Public
   --   License as published by the Free Software Foundation; either
   --   version 2.1 of the License, or (at your option) any later version.
   --   The GNU C Library is distributed in the hope that it will be useful,
   --   but WITHOUT ANY WARRANTY; without even the implied warranty of
   --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   --   Lesser General Public License for more details.
   --   You should have received a copy of the GNU Lesser General Public
   --   License along with the GNU C Library; if not, see
   --   <https://www.gnu.org/licenses/>.

   -- We define an additional symbol to signal that we use the GNU
   --   implementation of gettext.

   -- Provide information about the supported file formats.  Returns the
   --   maximum minor revision number supported for a given major revision.

   -- Look up MSGID in the current default message catalog for the current
   --   LC_MESSAGES locale.  If not found, returns MSGID itself (the default
   --   text).

   function gettext
     (uu_msgid : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr  -- /usr/include/libintl.h:39
   with Import => True, Convention => C, External_Name => "gettext";

   -- Look up MSGID in the DOMAINNAME message catalog for the current
   --   LC_MESSAGES locale.

   function dgettext
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_msgid      : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr  -- /usr/include/libintl.h:44
   with Import => True, Convention => C, External_Name => "dgettext";

   --  skipped func __dgettext

   -- Look up MSGID in the DOMAINNAME message catalog for the current CATEGORY
   --   locale.

   function dcgettext
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_msgid      : Interfaces.C.Strings.chars_ptr;
      uu_category   : int)
      return Interfaces.C.Strings.chars_ptr  -- /usr/include/libintl.h:51
   with Import => True, Convention => C, External_Name => "dcgettext";

   --  skipped func __dcgettext

   -- Similar to `gettext' but select the plural form corresponding to the
   --   number N.

   function ngettext
     (uu_msgid1 : Interfaces.C.Strings.chars_ptr;
      uu_msgid2 : Interfaces.C.Strings.chars_ptr;
      uu_n      : unsigned_long)
      return Interfaces.C.Strings.chars_ptr  -- /usr/include/libintl.h:61
   with Import => True, Convention => C, External_Name => "ngettext";

   -- Similar to `dgettext' but select the plural form corresponding to the
   --   number N.

   function dngettext
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_msgid1     : Interfaces.C.Strings.chars_ptr;
      uu_msgid2     : Interfaces.C.Strings.chars_ptr;
      uu_n          : unsigned_long)
      return Interfaces.C.Strings.chars_ptr  -- /usr/include/libintl.h:67
   with Import => True, Convention => C, External_Name => "dngettext";

   -- Similar to `dcgettext' but select the plural form corresponding to the
   --   number N.

   function dcngettext
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_msgid1     : Interfaces.C.Strings.chars_ptr;
      uu_msgid2     : Interfaces.C.Strings.chars_ptr;
      uu_n          : unsigned_long;
      uu_category   : int)
      return Interfaces.C.Strings.chars_ptr  -- /usr/include/libintl.h:73
   with Import => True, Convention => C, External_Name => "dcngettext";

   -- Set the current default message catalog to DOMAINNAME.
   --   If DOMAINNAME is null, return the current default.
   --   If DOMAINNAME is "", reset to the default of "messages".

   function textdomain
     (uu_domainname : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr  -- /usr/include/libintl.h:82
   with Import => True, Convention => C, External_Name => "textdomain";

   -- Specify that the DOMAINNAME message catalog will be found
   --   in DIRNAME rather than in the system locale data base.

   function bindtextdomain
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_dirname    : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr  -- /usr/include/libintl.h:86
   with Import => True, Convention => C, External_Name => "bindtextdomain";

   -- Specify the character encoding in which the messages from the
   --   DOMAINNAME message catalog will be returned.

   function bind_textdomain_codeset
     (uu_domainname : Interfaces.C.Strings.chars_ptr;
      uu_codeset    : Interfaces.C.Strings.chars_ptr)
      return Interfaces.C.Strings.chars_ptr  -- /usr/include/libintl.h:91
   with
     Import => True,
     Convention => C,
     External_Name => "bind_textdomain_codeset";

   -- Optimized version of the function above.
   -- We need NULL for `gettext'.
   -- We need LC_MESSAGES for `dgettext'.
   -- These must be macros.  Inlined functions are useless because the
   --   `__builtin_constant_p' predicate in dcgettext would always return
   --   false.

end libintl_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
