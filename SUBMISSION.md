# Directory submissions

What the Claude and ChatGPT directories ask for, and the answers for Zensei. Reviewer logins never go in this repository: enter them in each portal.

## Before either submission

- [ ] Add `https://www.zensei.com/mcp` as a custom connector in Claude, and as a developer-mode app in ChatGPT. Run every tool once in each.
- [ ] Create the reviewer test account: a Zensei account with an active Premium plan, sign-in by email and password, no 2FA, a watchlist with a few symbols.
- [ ] Record a short demo video (ChatGPT asks for one): the regime card, Expand, the rotation map, open a sector.

## Claude: Connectors Directory

Portal: [claude.ai/directory/manage](https://claude.ai/directory/manage) → **Submit new** → **MCP connector**. Guide: [Submit a connector](https://claude.com/docs/connectors/building/submission).

| Step | Answer |
| --- | --- |
| Connection | `https://www.zensei.com/mcp` |
| Tools | Synced from the server. All 12 tools have a title and `readOnlyHint: true`. |
| Server name | Zensei |
| One-liner | See what market regime US stocks are in and which sectors lead the S&P 500, with the Zensei Index and a sector rotation map. |
| Description | See [Long description](#long-description). |
| Categories | Finance, Data and analytics (pick the closest the portal offers) |
| Documentation URL | https://www.zensei.com/mcp |
| Privacy policy URL | https://www.zensei.com/privacy (section 04 covers AI apps) |
| Support contact | contact@zensei.com |
| Icon | `assets/logo.png` |
| URL slug | `zensei` (permanent) |
| Use cases | Market regime check, sector rotation, sector holdings, one stock against its sectors. Reads data only. |
| What users need | Nothing for public data. A Zensei account for the watchlist. A Premium plan for thematic sectors, full history and search. |
| Authentication | OAuth, **Required when the server asks**. No client to enter: Claude registers itself (client ID metadata document, or dynamic registration). |
| Data handling | Our own API. No health data. No sponsored content. |
| Allowed link URIs | `https://www.zensei.com` |
| Test & launch | The reviewer test account, signed in at https://www.zensei.com/login. |

### Carousel screenshots

PNG, at least 1000px wide, cropped to the app's answer, without the prompt. 3 to 5 images, each with its prompt. Ready in `screenshots/`, taken from the live views with live data:

| File | Prompt |
| --- | --- |
| `screenshots/1-index-inline.png` | What market regime are US stocks in today? |
| `screenshots/2-index-full.png` | Show me the full Zensei dashboard, with the volatility term structure. |
| `screenshots/3-map-inline.png` | Which sectors are leading the S&P 500 right now? |
| `screenshots/4-sector-drill.png` | What's leading inside the technology sector? |

Retake `1-index-inline.png` once the written market summary is current again: today it dates from July 2026.

## ChatGPT: plugin directory

Portal: [platform.openai.com/plugins](https://platform.openai.com/plugins) → **Upload new or existing plugin**. Guide: [Submission](https://developers.openai.com/apps-sdk/deploy/submission), [guidelines](https://developers.openai.com/apps-sdk/app-submission-guidelines).

1. Verify the business (WeGravel, Inc.) in the OpenAI organization settings. Only an owner, or a member with **Apps Management Write**, can submit.
2. Build the ZIP: `./scripts/package-openai.sh`. Upload `dist/zensei-chatgpt.zip`.
3. **Domain verification:** copy the token the portal shows. It must be served as plain text at `https://www.zensei.com/.well-known/openai-apps-challenge`. In the website repo, paste it into `OPENAI_APPS_CHALLENGE_TOKEN` in `src/server/mcp/index.ts`, then deploy.
4. **MCP connection:** choose **Mixed** access (public tools plus OAuth). Client registration: client ID metadata document, with dynamic registration as the fallback. Scope: `zensei:read`. No client secret.
5. **Review details:** enter the test account and the sign-in steps. Add the demo video URL to `review.demo_recording_url` in `plugin.json` and rebuild the ZIP.
6. Fix any findings, then **Submit for review** and accept the attestations.
7. After approval, select **Publish plugin**.

### Rules that shaped the listing

- No upgrade prompts and no links to checkout. The server sees ChatGPT (by user agent or OAuth client) and drops the pricing links and Premium wording from results and views.
- The listing text names no prices, plans or trials.
- Country list: `[]` (no restriction). Change `publication.countries` to limit it.

## Long description

Zensei tells you what market regime US stocks are in, and which sectors lead or lag the S&P 500.

The Zensei Index is a 0-100 risk score for the US stock market. Lower is healthier. Ten indicators feed it, in three layers: structural conditions (valuation, credit, real rates, Fed liquidity, risk appetite), tactical filters (volatility term structure, intraday dislocation) and regime confirmations (volatility, price trend, cross-asset stress). Ask for today's score and Zensei shows the regime card: the score, the regime label, the three layer scores and the latest written market summary. Expand it to see each indicator with its chart.

The sector scan compares every US sector ETF with the S&P 500: relative strength, momentum, quadrant and returns from one week to one year. Zensei draws it as a rotation map. Open a sector to see its holdings, the stocks that lead it and the ones that quietly outperform. Ask about one stock to see how it does inside its sectors.

Public data works without an account. Sign in with your Zensei account to see the data your plan includes and your Zensei watchlist.

Zensei explains market conditions. It does not give investment advice, predict prices or place trades.
