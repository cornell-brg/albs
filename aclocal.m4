#=========================================================================
# Local Autoconf Macros
#=========================================================================
# This file contains the macros for the automatic LaTeX build system and
# additional autoconf macros which developers can use in their
# configure.ac scripts. Please read the documentation in
# 'albs-uguide.txt' for more details on how the Automatic LaTeX Build
# System works. The documenation for each macro should include
# information about the author, date, and copyright.

#-------------------------------------------------------------------------
# ALBS_PROG_PDFLATEX
#-------------------------------------------------------------------------
# Checks to make sure that pdflatex is in users path otherwise the
# configuration fails.
#
# Author : Christopher Batten
# Date   : October 9, 2008

AC_DEFUN([ALBS_PROG_PDFLATEX],
[
  AC_CHECK_PROGS([pdflatex],[pdflatex],[no])
  AS_IF([test $pdflatex = "no"],
  [
    AC_MSG_ERROR([Automatic LaTeX Build System requires PDFLaTeX])
  ])
])

#-------------------------------------------------------------------------
# ALBS_PROG_BIBTEX
#-------------------------------------------------------------------------
# Checks to make sure that bibtex is in users path otherwise the
# configuration fails. Technically, we don't need BibTeX if we are not
# going to use a bibliography, but since pdflatex almost always comes
# with bibtex we stop if we cannot find bibtex since it means 
# something is probably setup wrong.
#
# Author : Christopher Batten
# Date   : October 9, 2008

AC_DEFUN([ALBS_PROG_BIBTEX],
[
  AC_CHECK_PROGS([bibtex],[bibtex],[no])
  AS_IF([test $bibtex = "no"],
  [
    AC_MSG_ERROR([Automatic LaTeX Build System requires BibTeX])
  ])
])

#-------------------------------------------------------------------------
# ALBS_PROG_RUBY
#-------------------------------------------------------------------------
# Checks to make sure that ruby is in users path otherwise the
# configuration fails. We use ruby to scan files, process latex
# dependencies, and to actually control running LaTeX/BibTeX.
#
# Author : Christopher Batten
# Date   : October 9, 2008

AC_DEFUN([ALBS_PROG_RUBY],
[
  AC_CHECK_PROGS([ruby],[ruby],[no])
  AS_IF([test $ruby = "no"],
  [
    AC_MSG_ERROR([Automatic LaTeX Build System requires ruby])
  ])
])

#-------------------------------------------------------------------------
# ALBS_MODULES
#-------------------------------------------------------------------------
# Used to specify a list of modules to use for this document. The list
# can include whitespace and newlines for readability.
#
# Author : Christopher Batten
# Date   : October 9, 2008

AC_DEFUN([ALBS_MODULES],
[

  # Add command line option to disable all modules

  AC_ARG_WITH(modules,
    AS_HELP_STRING([--without-modules],[Disable all modules]),
    [with_modules="no"],
    [with_modules="yes"])

  # Loop through the modules given in the macro argument

  m4_foreach([ALBS_MODULE],[$1],
  [

    # Create variations of the module name 

    m4_define([ALBS_MODULE_NORM],m4_normalize(ALBS_MODULE))
    m4_define([ALBS_MODULE_SHVAR_WITH],with_[]ALBS_MODULE_NORM)
    m4_define([ALBS_MODULE_SHVAR_EN],ALBS_MODULE_NORM[]_enabled)

    # Add command line option to disable module

    AC_ARG_WITH(ALBS_MODULE_NORM, 
      AS_HELP_STRING([--without-ALBS_MODULE_NORM],
        [Disable the ALBS_MODULE_NORM module]),
      [ALBS_MODULE_SHVAR_WITH="no"],
      [ALBS_MODULE_SHVAR_WITH="yes"])

    # Add module to our running list

    modules="$modules ALBS_MODULE_NORM"

    # For each module include the appropriate autoconf fragment

    AS_IF([test    "$ALBS_MODULE_SHVAR_WITH" = "yes" \
              -a "$with_modules" = "yes" ],
    [
      AC_MSG_NOTICE([configuring module : ALBS_MODULE_NORM])
      m4_include(ALBS_MODULE_NORM[]/ALBS_MODULE_NORM[].ac) 
    ],[
      AC_MSG_NOTICE([skipping module : ALBS_MODULE_NORM])
      ALBS_MODULE_SHVAR_EN="no"
    ])

  # Tell autoconf about the module's .mk.in file

    AC_CONFIG_FILES(ALBS_MODULE_NORM[].mk:ALBS_MODULE_NORM[]/ALBS_MODULE_NORM[].mk.in)

  # Substitute the module_enable make variable

    AC_SUBST(ALBS_MODULE_SHVAR_EN)

  ])

  # Output make variables

  AC_SUBST([modules])

])
