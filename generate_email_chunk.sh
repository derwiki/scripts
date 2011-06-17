#!/bin/bash
# This is probably not useful for anyone else

indices=$(seq -f %003.0f -s'_' $1 $2)
filename=${3}${indices}_seed.json
indices=$(seq -f %003.0f $1 $2)

if [ -e $filename ]; then
  echo File $filename already exists, please remove file and try again
  exit -1
fi

echo Using indices: $indices
echo Writing to file: $filename

for i in $indices; do
  filename_index=$3$i.json.gz
  echo Reading ${filename_index}...
  zcat $filename_index | sed 's/field1/anonymous_id/g' | sed 's/anonid/anonymous_id/g' >> $filename
done

cat causes_seedlist.json >> $filename

echo Generated file length: $(wc -l $filename | cut -d' ' -f 1)
echo Sample of generated file:
head -n 3 $filename
tail -n 3 $filename
echo
cp $filename /tmp/
echo "Copying to util1..."
scp -C $filename dev@util1:/tmp/
echo "Copying from util1 to app server..."
ssh dev@util1 "scp /tmp/$filename caujob01:/home/dev/"
echo "Removing from util1..."
#ssh dev@util1 "rm /tmp/$filename"
echo RAILS_ENV=prodrw bundle exec rake outreach:EMAIL -- --recipients-filename=/home/dev/$filename --track-source-id=$4
echo RAILS_ENV=prodrw bundle exec rake outreach:EMAIL -- --recipients-filename=/home/dev/$filename --track-source-id=$4 >> runfile

