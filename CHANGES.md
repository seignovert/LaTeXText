### 2021-06-21 - v0.1.3 ###

* fixed a warning in latextext.py
  latextext.py:471: SyntaxWarning: "is not" with a literal. Did you mean "!="?
    if self.options.math and latex_string[0] is not '$':

* install.sh: now sets the extension path depending on the operating system
  (Linux and Mac currently supported, more OSes can easily be added later)

### 2019-03-09 - v0.1.2 ###

* New option to directly enter a list of additional Latex packages to be 
  loaded without using a preamble file.

* Win64 Installer: reduce size and only install the GTK DLLs that are 
  absolutely required.


### 2017-11-13 - v0.1.1 ###

Fixed two problems with the Windows installer.

    * Add the Adwaita icons.

    * Add a gschemas.compiled file to avoid crash when the preamble file 
      chooser is openend.


### 2017-10-30 - v0.1 ###

Initial release.
