#!/usr/bin/env bash

if [ -f shared/automated-updates.sh ]; then
  source shared/automated-updates.sh
else
  echo "Check if submodule was loaded; automated-updates.sh is missing"
  exit 1
fi

getMysqlVersions() {
    PAGE_SIZE=100
    TOTAL=$(curl -s "https://registry.hub.docker.com/v2/repositories/library/mysql/tags?page_size=1" | jq '.count')
    PAGES=$(( (TOTAL + PAGE_SIZE - 1) / PAGE_SIZE ))

    for ((page=1; page<=PAGES; page++)); do
        curl -s "https://registry.hub.docker.com/v2/repositories/library/mysql/tags?page_size=${PAGE_SIZE}&page=${page}" | jq -r '.results[].name'
    done | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | sort -V
}

VERSIONS=$(getMysqlVersions)

for version in $VERSIONS; do
    generateVersions "$version"
    generateSearchTerms "PG_VER=" "$majorMinor/Dockerfile" ""
    directoryCheck "$majorMinor" "$SEARCH_TERM" true
    continueRelease "$newVersion"
done