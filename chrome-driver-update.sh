#!/bin/zsh

cd /Users/carlosgutierrez/Projects/bash-scripts
source file-system-helpers.sh

echo 'Fetching chrome driver versions...'
body=$(curl https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json)
links=$(echo "${body}" | egrep -o "https://[a-z0-9\.\/-]+/[0-9\.]+/mac-x64/chromedriver-mac-x64.zip")
allVersions=$(echo "${links}" | sed -E "s|https://[a-z.0-9/-]*/chrome-for-testing/([0-9.]*)/mac-x64/chromedriver-mac-x64.zip|\1|")
majorVersions=$(echo "${allVersions}" | sed "s/\.[0-9]*//g" | sort -u)

versionsArray=()
while read; do
    versionsArray+=( "$REPLY" )
done < <( echo "${majorVersions}" )

echo 'Which major chromedriver version do you wish to install?'
select version in ${versionsArray[@]};
do
	echo "$version was selected ($REPLY)"
	break;
done

if [[ "$version" == "" ]]
then
  echo "Invalid option!, you should specify the option number, not the version."
  exit 1
fi

lastVersion=$(echo "${allVersions}" | egrep "^${version}\." | tail -1)
echo "Installing version $lastVersion..."

file_folder="chromedriver-mac-x64"
file_zip="$file_folder.zip"
file_name="chromedriver"

downloadUrl=$(echo "${links}" | egrep "${lastVersion}")
echo "Downloading $downloadUrl..."
curl -LO $downloadUrl || exit 1

echo "Expanding $file_zip..."
unzip -qq $file_zip || exit 1

echo "Moving $file_name..."
cDriverLocation=$( which chromedriver ) || cDriverLocation="/usr/local/bin/chromedriver"
mv -f $file_folder/$file_name $cDriverLocation

remove_object $file_zip
remove_object $file_folder

echo "Done..."
