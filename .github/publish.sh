#!/bin/bash 
set -e

if [[ -z "${GEMFURY_PUSH_TOKEN}" ]]; then
  echo "Error: Must supply Gemfury push token"
  exit 1
else
  token="${GEMFURY_PUSH_TOKEN}"
fi

ls -la

# Get an array for both tarball and whl
targetfiles=($(cd dist && ls | grep '.tar.gz\|.whl'))

cd dist
for target in "${targetfiles[@]}" 
do
    echo "Publishing $target ... "
    curl -i -F package=@$target https://$token@push.fury.io/bsnacks000/ --fail
    statuscode=$?
    if [[ $statuscode != 0 ]]; then 
        echo "Error: Curl could not upload the package"
        exit 3 
    fi
done 
