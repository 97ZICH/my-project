#!/bin/bash

if [ $# -eq 0 ] && [ -z "$1" ]
  then
    echo "Expected arguments, please check the help : initdev –help"
    exit 1
fi

FIRST_ARG="$1"
shift

mkdir $FIRST_ARG
while test $# -gt 0; do
        case "$1" in
            -help)
                echo "Name : Afficher le nom de l’application et une petite description."
                echo ""
                echo "Syntax : Afficher la syntaxe d’utilisation de la commande initdev."
                echo ""
                echo "args : Lister les arguments et donner une description de chaque argument."
		echo ""
		echo "author : Afficher le nom et l’email de l’auteur de l’application"
                exit 0
                ;;
            -C)
		echo "int main(){return 0;}" > $FIRST_ARG/main.c
		shift
                ;;
            -CPP|-C++)
		echo "int main(){return 0;}" > $FIRST_ARG/main.cpp
                shift
		;;
            -Py)
		echo "#!/usr/bin/env python3" >> $FIRST_ARG/main.py
		echo "import sys" >> $FIRST_ARG/main.py
		echo "exit 0" > $FIRST_ARG/main.py
                shift
		;;
            -Latex)
		echo "\documentclass{article}" >> $FIRST_ARG/main.tex
		echo "\usepackage[utf8]{inputenc}" >> $FIRST_ARG/main.tex
		echo "\usepackage[english]{babel}" >> $FIRST_ARG/main.tex
		echo "\usepackage{graphicx}" >> $FIRST_ARG/main.tex
		echo "\graphicspath{{images/}{../images/}}" >> $FIRST_ARG/main.tex
		echo "\usepackage{subfiles}" >> $FIRST_ARG/main.tex
		echo "\usepackage{blindtext}" >> $FIRST_ARG/main.tex
		echo "\title{Subfile Example}" >> $FIRST_ARG/main.tex
		echo "\author{Team Learn ShareLaTeX}" >> $FIRST_ARG/main.tex
		echo "\date{ }" >> $FIRST_ARG/main.tex
		echo "\begin{document}" >> $FIRST_ARG/main.tex
		echo "\maketitle" >> $FIRST_ARG/main.tex
		echo "\section{Introduction}" >> $FIRST_ARG/main.tex
		echo "\subfile{sections/introduction}" >> $FIRST_ARG/main.tex
		echo "\section{Second section}" >> $FIRST_ARG/main.tex
		echo "\subfile{sections/section2}" >> $FIRST_ARG/main.tex
		echo "\end{document}" >> $FIRST_ARG/main.tex
                shift
		;;
	    -BEAMER)
		echo "\documentclass{beamer}" >> $FIRST_ARG/main.tex
		echo "\usepackage[utf8]{inputenc}" >> $FIRST_ARG/main.tex
		echo "%Information to be included in the title page:" >> $FIRST_ARG/main.tex
		echo "\title{Sample title}" >> $FIRST_ARG/main.tex
		echo "\author{Anonymous}" >> $FIRST_ARG/main.tex
		echo "\institute{ShareLaTeX}" >> $FIRST_ARG/main.tex
		echo "\date{2014}"  >> $FIRST_ARG/main.tex
		echo "\begin{document}" >> $FIRST_ARG/main.tex
		echo "\frame{\titlepage}" >> $FIRST_ARG/main.tex
		echo "\begin{frame}" >> $FIRST_ARG/main.tex
		echo "\frametitle{Sample frame title}" >> $FIRST_ARG/main.tex
		echo "This is a text in first frame. This is a text in first frame. This is a text in first frame." >> $FIRST_ARG/main.tex
		echo "\end{frame}" >> $FIRST_ARG/main.tex
		echo "\end{document}" >> $FIRST_ARG/main.tex
		shift
		;;
	    -GPL)
                shift
		;;
            -MIT)
                shift
		;;
	    *)
		echo "Uknown arguments, please check the help : initdev –help $test"
		rm -rf $FIRST_ARG
		exit 1
                ;;
        esac
done

touch $FIRST_ARG/LICENSE
touch $FIRST_ARG/Makefile

exit 0
