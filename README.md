# namanuttarakhand.com

Static website for **Naman Uttarakhand**, built to satisfy Meta (Facebook/Instagram) business
and domain verification requirements — a public site with a clear business identity,
contact details, Privacy Policy, Terms & Conditions and advertising Disclaimer.

## Pages

| File | URL | Purpose |
|---|---|---|
| `index.html` | `/` | Home — business identity and what we do |
| `about.html` | `/about.html` | About the business, business details block |
| `contact.html` | `/contact.html` | Contact details and privacy-request address |
| `privacy-policy.html` | `/privacy-policy.html` | Privacy Policy (required by Meta) |
| `terms.html` | `/terms.html` | Terms & Conditions |
| `disclaimer.html` | `/disclaimer.html` | Website + advertising disclaimer |

No build step, no dependencies. Plain HTML and one stylesheet (`assets/style.css`).

## Before going live — fill these in

Search and replace across all files:

- `info@namanuttarakhand.com` — real business email
- `Dehradun, Uttarakhand, India` — full registered address
- Phone / WhatsApp number — not yet present, add to `contact.html` and the footer
- Legal entity name and GSTIN / registration number, if registered — add to `about.html`
- `20 August 2026` — the "Last updated" date on the three policy pages
- Confirm the service description matches the actual business

## Local preview

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

## Deploying

Any static host works. Two easy options:

**GitHub Pages** — Settings → Pages → Source: `main` branch, `/` root.
Then add `namanuttarakhand.com` as the custom domain and point DNS at GitHub.

**Vercel** — `vercel --prod` from this directory, then add the domain in the
project settings.

## Meta verification checklist

- [ ] Site live on `https://namanuttarakhand.com` with a valid SSL certificate
- [ ] Privacy Policy reachable from every page footer
- [ ] Business name on the site matches the Meta Business Manager name exactly
- [ ] Contact email on the site uses the domain (`@namanuttarakhand.com`)
- [ ] Domain verified in Business Manager → Brand Safety → Domains (DNS TXT or meta-tag)

For the meta-tag verification method, paste the tag Meta gives you into the
`<head>` of `index.html`.
