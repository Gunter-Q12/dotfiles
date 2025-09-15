#/usr/bin/sh

FILE="update_code.sh"

cat ${FILE}.tmpl | chezmoi execute-template | tee $FILE
chmod u+x ./$FILE
./$FILE