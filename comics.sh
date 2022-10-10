#!/bin/bash

titre=$(echo $1 | sed 's/https:\/\/readcomicsonline.ru\/comic\///')

chapter=$(echo $2)

std="https://readcomicsonline.ru/uploads/manga/"

url=$std$titre/chapters/

for ((i=1;i<=$2;i++))
do
        for j in $(seq -w 01 50)
        do
                wget $url$i/$j.jpg
        done

        convert "*.{jpg}" -quality 100 output $titre_$chapter.pdf
done
