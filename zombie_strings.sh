#!/bin/bash

rootFolder=.
if [[ $1 ]]; then
  rootFolder=$1
fi

keys=()

allLocalisableFiles=$(find $rootFolder -type f -name "*.strings");
for localisableFile in $allLocalisableFiles; do
  echo "🔎  Inspecting:" $localisableFile

  while read p; do
    IFS=" = ";
    string=($p);
    key=${string[0]}
    if [[ ${#string[@]} -gt 1 ]] && [[ $key == \"* ]]; then
      if ! echo "${keys[@]}" | grep -q -w "$key"; then
        keys+=($key)
      fi
    fi
    unset IFS;
  done < $localisableFile
done

for key in "${keys[@]}"; do
  if ! grep -rsq --include=\*.{swift,m,h} $key $rootFolder; then
    echo "⚠️ " $key "is not used 💀"
  fi
done
