#!/usr/bin/env bash
# Deploy the static site to the cPanel host over FTPS.
#
# Credentials are NEVER stored in this repo. Create a netrc file outside the
# repo (e.g. ~/.namanuk-netrc, chmod 600) containing:
#
#   machine ftp.namanuttarakhand.com
#   login deploy@namanuttarakhand.com
#   password YOUR_PASSWORD
#
# Then run:  NETRC=~/.namanuk-netrc ./deploy.sh

set -euo pipefail

HOST="ftp.namanuttarakhand.com"
NETRC="${NETRC:-$HOME/.namanuk-netrc}"

FILES=(
  index.html
  about.html
  contact.html
  privacy-policy.html
  terms.html
  disclaimer.html
  robots.txt
  sitemap.xml
  assets/style.css
)

if [[ ! -f "$NETRC" ]]; then
  echo "error: netrc file not found at $NETRC" >&2
  echo "see the header of this script for its format" >&2
  exit 1
fi

cd "$(dirname "$0")"

# --ssl-reqd encrypts the session. -k skips hostname verification because the
# shared host presents a certificate for its own hostname, not this domain.
for f in "${FILES[@]}"; do
  curl -sS --netrc-file "$NETRC" --ssl-reqd -k \
       --connect-timeout 25 --max-time 120 --ftp-create-dirs \
       -T "$f" "ftp://$HOST/$f"
  echo "  uploaded  $f"
done

echo
echo "verifying over https..."
for f in "${FILES[@]}"; do
  code=$(curl -sS -o /dev/null -w '%{http_code}' --max-time 30 \
         "https://namanuttarakhand.com/$f")
  printf '  %s  %s\n' "$code" "$f"
done
