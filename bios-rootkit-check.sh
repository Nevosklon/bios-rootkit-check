#!/bin/bash

# The Affected device will have the
# certificate serial number 55:fb:ef:87:81:23:00:84:47:17:0b:b3:cd:87:3a:f4
# the affected device will also have 
# "CN=DO NOT TRUST" or "CN=DO NOT SHIP" in the certifgate name (CN=)

# PK (platform key) is in /sys/firmware/efi/efivar/
grep -aqE 'DO NOT (TRUST|SHIP)' /sys/firmware/efi/efivars/PK*

if [ $? -eq 1 ]; then
  echo 'CVE-2024-41-43: Not found'
else 
  echo 'CVE-2024-41-43: FOUND !!!!!!!!!!'
fi

