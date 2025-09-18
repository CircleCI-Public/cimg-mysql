#!/usr/bin/env bash

if [ -f shared/automated-updates.sh ]; then
  source shared/automated-updates.sh
else
  echo "Check if submodule was loaded; automated-updates.sh is missing"
  exit 1
fi

getMysqlVersions() {
  URL="https://dev.mysql.com/doc/relnotes/mysql/8.4/en/"
  block=$(curl -sL "$URL" | awk '/id="docs-version-list"/,/<\/div>/')
  echo "$block" | tr '\n' ' ' | grep -o '<a[^>]*>[^>]*</a>' | sed -E 's/.*>([^<]+)<.*/\1/' | grep -Eo '[0-9]+(\.[0-9]+)+' | sort -V -u
}

VERSIONS=$(getMysqlVersions)
for version in $VERSIONS; do
  generateVersions "$version"
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
