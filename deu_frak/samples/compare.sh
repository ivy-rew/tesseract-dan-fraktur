#!/bin/bash
pic=$1
no=$2
dir=$(pwd)

if [ ! -f $pic-deu_frak.txt ]; then
 tesseract $pic $pic-deu_frak -l deu_frak
fi

if [ ! -f $pic-deu_frak36.txt ]; then
  tesseract $pic $pic-deu_frak36 -l deu_frak36+deu_frak
fi

tesseract $pic $pic-deu_frak$no -l deu_frak$no+deu_frak

meld $pic-deu_frak36.txt $pic-deu_frak$no.txt
