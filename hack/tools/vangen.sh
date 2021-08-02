#!/bin/bash -e
cd ${args[0]}
package=$(go list)
domain=${package%/*}
prefix=${package#*/}
packagesJson=$(jq -nrR '[inputs]' <<< "$(go list -f '{{ .ImportPath }}' ./... | tail -n+2 | sed -e "s/${domain}\/${prefix}\///g")")

{
jq -rn \
   --arg domain "$domain" \
   --arg prefix "$prefix" \
   --argjson subs "$packagesJson" \
   '{
        "domain": $domain,
        "repositories": [
            {
                "prefix": $prefix,
                "subs": $subs,
                "url": [ "https://github.com/fybrik/", $prefix ] | join("")
            }
        ]
    }'
} > vangen.json
