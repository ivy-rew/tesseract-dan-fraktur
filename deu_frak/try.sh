#!/bin/sh

echo "enter language number"
read n
lang=deu_frak$n
bash buildscript.sh
mv deu_frak.traineddata $lang.traineddata
sudo cp $lang.traineddata /usr/share/tesseract-ocr/tessdata/
for f in *.pbm
do
  tesseract $f $lang$f -l $lang
  cat $lang$f.txt
done
