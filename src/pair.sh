# Copyright 2026 rgbTrust
# made by Copilot
# What it does:

#loops through files in the current directory
#skips directories
#creates a folder for each file extension
#moves each file into its matching folder
#puts files without an extension into no_extension/

for file in *; do
  [ -f "$file" ] || continue

  ext="${file##*.}"
  if [ "$file" = "$ext" ]; then
    ext="no_extension"
  fi

  mkdir -p "$ext"
  mv -- "$file" "$ext/"
done
