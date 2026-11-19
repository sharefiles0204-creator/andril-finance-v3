# Andril Finance — personal finance PWA

## Included
- Dark charcoal + muted gold theme and your supplied Andril emblem as the app icon
- Separate income and expense entries, daily/monthly/yearly/all-time summaries
- Wedding project register: couple, wedding date, package value, advance, payments received, calculated pending balance
- Project-linked payments and project costs (crew, assistant, rental, travel, etc.)
- Separate freelance category workflow, rental register, monthly/all-time reports
- Project PDF statements, overall PDF report, CSV export, JSON backup/restore
- PWA install support for Android/desktop

## Important accounting rule
The dashboard counts only money actually received as income and money actually paid as expenses. A wedding package amount is not counted as income until a payment is received. Pending client balances are shown separately. This avoids overstating your cash.

## Local use
Serve this folder over HTTPS (or localhost for testing). Open the URL in Chrome on Android, choose Install app / Add to Home screen. Data is saved in this browser on this device. Export a backup regularly.

## Optional private sign-in and cloud sync
The app includes Supabase email/password and Google OAuth sign-in hooks. To enable:
1. Create a Supabase project.
2. Run `supabase-schema.sql` in its SQL Editor.
3. Enable Email auth and Google provider under Authentication > Providers.
4. In Google Cloud Console, configure OAuth client credentials and add the Supabase callback URL shown in Supabase to the authorised redirect URIs.
5. Add your deployed app URL to Supabase Authentication > URL Configuration > Redirect URLs.
6. In the app, open Privacy & backup and enter the Supabase Project URL and publishable/anon key.
7. Sign in and press Sync (sync is currently manual after sign-in; automatic local edits are queued for the active session).

For a personal-only account, create your account and then disable public sign-ups in Supabase Auth settings. Do not put a Supabase service-role key in this app. Supabase cloud storage is not end-to-end encrypted; use a strong account password, enable MFA where available, and keep encrypted/private backups.

## Known first-build limitations
- Google OAuth needs your own Supabase + Google Cloud setup; the app cannot sign in until configured.
- Local device data and cloud data are not a substitute for a tested production accounting system. Test with sample entries first.
- Rental entries marked Paid are added as expenses. Pending rental entries are kept in the rental register but not counted as paid expenses.
- For a project, use the “Payment” action for every instalment received; this makes received and pending balances calculate correctly.

## Security clarification
This first prototype stores its working records in browser localStorage, which is not encrypted at rest by this app. The visible Lock button is a session hide/lock screen, not device-grade authentication. Do not treat local storage as protected against someone with access to your unlocked phone/browser. The Supabase sign-in protects cloud access only; Google OAuth must be configured before it works. Keep your Android screen lock enabled and store backups privately.
