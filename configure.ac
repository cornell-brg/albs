#=========================================================================
# Toplevel configure.ac for the Automatic LaTeX Build System
#=========================================================================
# Please read the documentation in 'albs-uguide.txt' for more details on
# how the Automatic LaTeX Build System works. For most projects, a
# writer will only need to change the project metadata listed right
# below.

#-------------------------------------------------------------------------
# Project metadata
#-------------------------------------------------------------------------

m4_define( proj_name,         [Automatic LaTeX Build System])
m4_define( proj_version,      [0.1.1])
m4_define( proj_maintainer,   [Christopher Batten])
m4_define( proj_abbreviation, [albs])

#-------------------------------------------------------------------------
# Setup
#-------------------------------------------------------------------------

AC_INIT(proj_name,proj_version,proj_maintainer,proj_abbreviation)
AC_CONFIG_SRCDIR([src/]AC_PACKAGE_TARNAME[.tex])
AC_CONFIG_AUX_DIR([scripts])
AC_CANONICAL_BUILD

ALBS_INIT

#-------------------------------------------------------------------------
# Checks for programs
#-------------------------------------------------------------------------

ALBS_PROG_PDFLATEX
ALBS_PROG_BIBTEX
ALBS_PROG_RUBY

AC_PROG_INSTALL

#-------------------------------------------------------------------------
# Build System Modules
#-------------------------------------------------------------------------

ALBS_MODULES([svg,mat])

#-------------------------------------------------------------------------
# Output
#-------------------------------------------------------------------------

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
