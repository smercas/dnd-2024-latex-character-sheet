#!/usr/bin/env bash
#
#  Build the character sheet.
#
#    ./make.sh            build character-sheet.pdf
#    ./make.sh clean      remove build leftovers and the PDF
#
#  Reads layout.tex (the drawing) which pulls in character.tex (your data)
#  and writes character-sheet.pdf.  One pdflatex pass is enough: there are
#  no references, no table of contents and no bibliography.

set -u

JOB=character-sheet
cd "$(dirname "$0")" || exit 1

if [ "${1-}" = "clean" ]; then
    rm -f "$JOB".aux "$JOB".log "$JOB".out "$JOB".pdf
    echo "cleaned"
    exit 0
fi

if ! command -v pdflatex > /dev/null 2>&1; then
    echo "error: pdflatex not found. Install TeX Live, e.g." >&2
    echo "  Debian/Ubuntu: sudo apt install texlive-latex-recommended \\" >&2
    echo "                     texlive-fonts-extra texlive-pictures" >&2
    echo "  Fedora:        sudo dnf install texlive-scheme-medium" >&2
    echo "  macOS:         brew install --cask mactex-no-gui" >&2
    exit 1
fi

if [ ! -f character.tex ]; then
    echo "note: character.tex is missing, the sheet will print blank" >&2
fi

echo "building $JOB.pdf ..."
if pdflatex -interaction=nonstopmode -halt-on-error \
            -jobname="$JOB" layout.tex > /dev/null 2>&1; then
    rm -f "$JOB".aux "$JOB".out
    echo "ok -> $JOB.pdf"
    rm -f "$JOB".log
else
    echo "" >&2
    echo "BUILD FAILED. The error is almost certainly in character.tex;" >&2
    echo "layout.tex is generated and known good. Most common causes:" >&2
    echo "  * an unbalanced { or }" >&2
    echo "  * a bare & % # or _ that needs a backslash: \\& \\% \\# \\_" >&2
    echo "" >&2
    echo "First error from $JOB.log:" >&2
    grep -m1 -A4 '^!' "$JOB".log >&2
    exit 1
fi
