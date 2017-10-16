# Zombie Strings

In order to find localizable strings that are no longer used in your Xcode project, you can run the following script:

```
./zombie_strings.sh path/to/the/project/root/folder
```

Or simply the following if you are already in the project's root folder:

```
./zombie_strings.sh
```

This script will recursively iterate over all the .strings files, checking if each of the localizable strings inside it are ever used in any source file in the project.

```
./zombie_strings.sh ~/project

🔎  Inspecting: ~/project/Resources/Localizable.strings
⚠️  "No_longer_used_string" is not used 💀
```
