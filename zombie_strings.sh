#!/bin/bash

rootFolder=.
if [[ $1 ]]; then
  rootFolder=$1
fi

allLocalisableFiles=$(find $rootFolder -type f -name "*.strings" | grep -v /Pods/);
for localisableFile in $allLocalisableFiles; do
  echo -e "\n🔎  Inspecting:" $localisableFile

  while read p; do
    IFS=" = ";
    string=($p);
    key=${string[0]}
    if [[ ${#string[@]} -gt 1 ]] && [[ $key == \"* ]]; then
      if ! grep -rsq --include=\*.{swift,m,h} $key $rootFolder; then
        echo "⚠️ " $key "is not used 💀"
      fi
    fi
    unset IFS;
  done < $localisableFile
done
