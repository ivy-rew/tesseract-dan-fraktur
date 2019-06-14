#!/bin/sh

rm *.tr
rm *.traineddata

echo "enter language number"
read n
lang=deu_frak$n
bash buildscript.sh
mv deu_frak.traineddata $lang.traineddata
sudo cp -i -v $lang.traineddata /usr/share/tesseract-ocr/tessdata/
cd samples
for f in *.pbm
do
  tesseract $f $lang$f -l $lang+deu_frak
  tesseract $f deu_frak$f -l deu_frak
  cat $lang$f.txt
done
