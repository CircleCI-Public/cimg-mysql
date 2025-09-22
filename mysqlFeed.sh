#!/usr/bin/env bash

if [ -f shared/automated-updates.sh ]; then
  source shared/automated-updates.sh
else
  echo "Check if submodule was loaded; automated-updates.sh is missing"
  exit 1
fi

getMysqlVersions() {
  curl -s "https://api.github.com/repos/mysql/mysql-server/tags?per_page=200" | \
  jq -r '.[] | 
      select(.name | test("mysql-cluster-8\\.[1-9]|mysql-cluster-[9-9]\\.[0-9]|mysql-cluster-[1-9][0-9]\\.[0-9]")) | 
      .name | 
      sub("mysql-cluster-"; "")' | \
  sort -V -r
}

VERSIONS=$(getMysqlVersions)
for version in $VERSIONS; do
  # MySQL does not provide a artifcat for this versions anymore.
  if [ "$version" == "9.0.0" ] || [ "$version" == "8.4.1" ]; then
    continue
  fi
  generateVersions "$version"
  generateSearchTerms "MYSQL_VERSION=" "$majorMinor/Dockerfile"
  echo "The search term is: $SEARCH_TERM"
  directoryCheck "$majorMinor" "$SEARCH_TERM"

  # This condition only happens when the version in the docker file is less than the version of the loop
  if [[ $(eval echo $?) == 0 ]]; then
    echo "Condition met with $version"
    generateVersionString "$newVersion"
  fi
done

if [ -n "${vers[*]}" ]; then
  rm -rf releases.txt
  echo "Included version updates: ${vers[*]}"
  echo "Running release script"
  ./shared/release.sh "${vers[@]}"
else
  echo "No new version updates"
  exit 0
fi
