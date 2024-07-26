#!/bin/bash
set -x

# Ensure efi-readvar is installed
# The Affected device will have the
# certificate serial number 55:fb:ef:87:81:23:00:84:47:17:0b:b3:cd:87:3a:f4
# the affected device will also have 
# "CN=DO NOT TRUST" or "CN=DO NOT SHIP" in the certifgate name (CN=)


if ! command -v efi-readvar --help &> /dev/null; then
  echo "efivar could not be found. Please install it first."
  exit 1
fi

# Find the Platform Key (PK) variable

sudo efi-readvar -v PK | grep -E "CN=DO NOT (TRUST|SHIP)"
