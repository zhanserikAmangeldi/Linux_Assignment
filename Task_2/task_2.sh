#! usr/bin/bash

id="22B030301"

dir="dest"

unzip ../source/archive_1.zip -d $dir 

i=2

while grep -iR "not empty" "$dir"
do
  unzip -o "$dir/archive_$i.zip" -d "$dir"
  rm -r "$dir/archive_$i.zip" "$dir/empty.txt"
  ((i++))
done
echo $i

file="$(find ./$dir -name "*.txt")"
echo "_22B030301" >> $file
Code_word=$(grep -oE '[^ ]+$' $file)


sed -i '1d' $file && echo $Code_word >> $file

cd "$dir"
zip "archive_$i.zip" *

rm *.txt

echo "not empty" >> empty.txt
((i--))

while [[ i -gt 0 ]]; do
  zip "archive_$i.zip" "archive_$((i + 1)).zip" empty.txt
  rm "archive_$((i + 1)).zip"
  (( i-- ))
done

cd ..

mv $dir/archive_1.zip ./archive_1_new.zip
rm -r dir
