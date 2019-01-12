#!/bin/sh
set -ue

FILE=draft-ietf-spring-segment-routing-policy-02.md
FOOTER_REGEX="^Filsfils.*$"
HEADER_REGEX="^Internet-Draft.*$"

H2_REGEX="^[0-9]*\. "
H3_REGEX="^[0-9]*\.[0-9]*\. "
H4_REGEX="^[0-9]*\.[0-9]*\.[0-9]*\. "
H5_REGEX="^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\. "
H6_REGEX="^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\. "

echo \[\+\] List the mached as-a Header and Footer
echo \ \ \* header: match=`grep "$HEADER_REGEX" $FILE | wc -l`, regex=\"$HEADER_REGEX\"
echo \ \ \* footer: match=`grep "$FOOTER_REGEX" $FILE | wc -l`, regex=\"$FOOTER_REGEX\"
sed -i -e "s/\($HEADER_REGEX\)//g" $FILE
sed -i -e "s/\($FOOTER_REGEX\)//g" $FILE

echo \[\+\] List the mached as-a H2,H3,H4,H5,H6
echo \ \ \* h2: match=`grep "$H2_REGEX" $FILE | wc -l`, regex=\"$H2_REGEX\"
echo \ \ \* h3: match=`grep "$H3_REGEX" $FILE | wc -l`, regex=\"$H3_REGEX\"
echo \ \ \* h4: match=`grep "$H4_REGEX" $FILE | wc -l`, regex=\"$H4_REGEX\"
echo \ \ \* h5: match=`grep "$H5_REGEX" $FILE | wc -l`, regex=\"$H5_REGEX\"
echo \ \ \* h6: match=`grep "$H6_REGEX" $FILE | wc -l`, regex=\"$H6_REGEX\"
sed -i -e "s/\($H2_REGEX\)/## \1/g" $FILE
sed -i -e "s/\($H3_REGEX\)/### \1/g" $FILE
sed -i -e "s/\($H4_REGEX\)/#### \1/g" $FILE
sed -i -e "s/\($H5_REGEX\)/##### \1/g" $FILE
sed -i -e "s/\($H6_REGEX\)/###### \1/g" $FILE

