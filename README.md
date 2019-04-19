
Automatic LaTeX Build System Template
==========================================================================

 - Author: Christopher Batten
 - Date: April 19, 2009

This is a template for the Automatic LaTeX Build System. Please refer to
`albs-uguide.txt` for more information on the build system. Writers
should eventually replace this `README` file with information on their
new project if they are going to generally distribute the LaTeX source
code. It is recommended that the new `README` file keep a pointer to
`albs-uguide.txt`.

Template Instantiation
--------------------------------------------------------------------------

 - Update the project metadata (name, version, etc) in `configure.ac`
 - Run `autoconf` in project's root directory
 - Rename `src/paper-albs.tex` to abbreviated form of project name (with `.tex`)

Build Steps
--------------------------------------------------------------------------

```
 % mkdir build
 % cd build
 % ../configure
 % make
 % make paper-albs.pdf
 % make paper-ieee-albs.pdf
 % make paper-acmart-albs.pdf
 % make paper-acm-albs.pdf
 % make report-albs.pdf
 % make slides-albs.pdf
 % make poster-albs.pdf
```

