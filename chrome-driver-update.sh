#!/bin/zsh

function remove_object {
  object=$1
  if [ -f $object ]; then
    echo "Removing file ${object}..."
    rm $object
  elif [ -d $object ]; then
    echo "Removing directory ${object}..."
    rm -rf $object
  fi
}

echo 'Fetching chrome driver versions...'
body=$(curl https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json)
allVersionsStr=$( echo "${body}" | egrep -o "\"version\":\"[0-9\.]+\"" | egrep -o "[0-9\.]+" )
versions=()
while read; do
    versions+=( "$REPLY" )
done < <( echo "${allVersionsStr}" | sed "s/\.[0-9]*//g" | sort -u )

echo 'Which major chromedriver version do you wish to install?'
select version in ${versions[@]};
do
	echo "$version was selected ($REPLY)"
	break;
done

if [[ "$version" == "" ]]
then
  echo "Invalid option!, you should specify the option number, not the version."
  exit 1
fi

lastVersion=$( echo "${allVersionsStr}" | egrep "^${version}\." | tail -1 )
echo "Installing version $lastVersion..."

file_folder="chromedriver-mac-x64"
file_zip="$file_folder.zip"
file_name="chromedriver"
downloadUrl="https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/$lastVersion/mac-x64/$file_zip"
fileMatch=$( echo "${body}" | grep "${downloadUrl}" )
if [[ "${fileMatch}" == "" ]];
then
  echo "The selected version does not include chrome driver."
  exit 1
fi
echo "Downloading $downloadUrl..."
curl -LO $downloadUrl || exit 1

echo "Expanding $file_zip..."
unzip -qq $file_zip || exit 1

echo "Moving $file_name..."
cDriverLocation=$( which chromedriver )
mv -f $file_folder/$file_name $cDriverLocation

remove_object $file_zip
remove_object $file_folder

echo "Done..."
