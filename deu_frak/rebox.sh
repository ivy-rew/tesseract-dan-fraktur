#!/bin/bash

no=$1
lang=$2

file=deu_frak.schilling$no
tesseract $file.tif $file-$no -l deu_frak+deu_frak$lang batch.nochop makebox
newbox=$file-$no.box

meld $file.box $newbox
