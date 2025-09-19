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
  # Version 9.0.0 is not available
  if [ "$version" = "9.0.0" ]; then
    local_version="9.0.1"
  else
    local_version="$version"
  fi
  generateVersions "$local_version"
  generateSearchTerms "MYSQL_VERSION_MINOR=" "$majorMinor/Dockerfile" ""
  directoryCheck "$majorMinor" "$SEARCH_TERM" true
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
