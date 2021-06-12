#!/bin/bash

DEPENDENCIES=true
GTK3=false

OS=`uname -s`

case $OS in
  Linux*) EXTENSIONS_DIR=~/.config/inkscape/extensions/ ;;
  Darwin*) EXTENSIONS_DIR=~/Library/Application\ Support/org.inkscape.Inkscape/config/inkscape/extensions/ ;;
  *) echo "$OS unknown or not yet supported" 1>&2 ; exit 1 ;;
esac

echo -n "Check if Python LXML is available... "
python -c "import lxml" 2> /dev/null
if [ $? -ne 0 ]; then
    echo "NOT FOUND"
    DEPENDENCIES=false
else
    echo "OK"
fi

if [ "$DEPENDENCIES" = false ]; then
    echo "ERROR: some required Python modules are missing."
    exit
fi

echo -n "Check if PyGObject is available... "
python -c "import gi" 2> /dev/null
if [ $? -ne 0 ]; then
    echo "NOT FOUND, installing standard extension GUI"
    GTK3=false
else
    GTK3=true
    echo "OK"
fi

echo -n "Copying extension to $EXTENSIONS_DIR ... "

cp extension/latextext.py "$EXTENSIONS_DIR"
    
if [ "$GTK3" = true ]; then
    cp extension/latextext_gtk3.py "$EXTENSIONS_DIR"
    cp extension/latextext_gtk3.inx "$EXTENSIONS_DIR"
else
    cp extension/latextext.inx "$EXTENSIONS_DIR"
fi

echo "done"
