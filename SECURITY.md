# Security Policy

## Supported Versions

Only the latest minor release of `mb_contact_form` receives security fixes.

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

`mb_contact_form` is a Flutter UI widget package that renders a contact form and
opens URLs via `url_launcher` — it does not make direct network requests, handle
authentication, or store user data on its own. That said, if you believe you've
found a vulnerability (for example, an issue with URL handling, a problem in a
transitive dependency exposed via this package, or unexpected data exposure),
please **do not open a public issue**.

Report it privately via GitHub Security Advisories:

➡️ [Report a vulnerability](https://github.com/moulibheemaneti/mb_contact_form/security/advisories/new)

You can expect:
- An acknowledgement within **7–14 days**.
- A status update within **30–45 days**.
- If accepted, a fix will land in the next patch release and you'll be credited in the release notes (unless you prefer to remain anonymous).
- If declined, you'll receive an explanation of why.
