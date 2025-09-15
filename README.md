A simple but hopefully complete Ada wrapper around
[gettext](https://www.gnu.org/software/gettext/). It should run on linux and
windows. Don't know for other OSes.

# How to use

Before calling the `gettext` family translation functions:

- You **must** set the locale using `Gettexts.Locale.Set_Locale` (even a call
  with no arguments is enough but required).
- You should set the directory and the domain name with
  `Gettexts.Set_Text_Domain_Directory` and `Gettexts.Set_Text_Domain`.
- You should set the codeset with `Gettexts.Set_Text_Domain_Codeset`.

# Function names

You can choose between:

- Standard names used in C language: `gettext`, `ngettext`, `pgettext`, `dgettext`…
- More readable Ada names: `Get_Text`, `Get_Plural_Text`, `Get_Text_With_Context`…

# Limits

There's no support for Ada in
[xgettext](https://www.gnu.org/software/gettext/manual/html_node/xgettext-Invocation.html).
But if your code doesn't have unbalanced tick marks (like in `'Class`), you
can still use it to produce and update `.po` files (see `update.sh` in example
directory). As a workaround, you can balance tick marks with comments `--  '`.

# Note

Github is not my main development forge, but only a mirror of a
selfhosted [forgejo](https://forgejo.org/).
