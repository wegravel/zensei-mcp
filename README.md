# Zensei MCP server

The [MCP](https://modelcontextprotocol.io) server for [Zensei](https://www.zensei.com): the Zensei Index and the sector rotation scan, in Claude, ChatGPT and any MCP client.

The Zensei Index is a 0-100 risk score for the US stock market. **Lower is healthier.** The sector scan compares every US sector ETF with the S&P 500.

- **URL:** `https://www.zensei.com/mcp`
- **Transport:** Streamable HTTP
- **Auth:** optional OAuth 2.1. Public data works without an account. Tools that need an account ask the user to sign in.
- **Docs:** <https://www.zensei.com/mcp>

This repository holds the server metadata and the plugin packages. The server runs on zensei.com.

## Tools

All tools are read-only.

| Tool | Returns | Access |
| --- | --- | --- |
| `zensei_index_about` | What the index is, how to read the 0-100 score, and how it is built. | Free |
| `zensei_index_today` | Today's final score, its regime label, and the three layer scores. | Free |
| `zensei_index_indicators` | The ten indicators behind the score, each with its status, group, weight and explanation. | Free |
| `zensei_index_summary` | The latest written market summary, with its date and a stale flag. | Free |
| `zensei_index_history` | Daily scores with their regime. | One month free, up to ten years with Premium |
| `zensei_sectors_scan` | Every sector ETF against the S&P 500: quadrant, momentum, relative strength, returns. | 11 broad sectors free, 100+ with Premium |
| `zensei_sector_detail` | One sector in depth, with its largest holdings. | Broad sectors free |
| `zensei_stock_detail` | How a stock does against the sectors that hold it. | Broad sectors free |
| `zensei_search` | Find sector ETFs and stocks by ticker or name. | Premium |
| `zensei_my_watchlist` | The user's saved symbols on Zensei. | Zensei account |

## Interactive views

In apps that support [MCP Apps](https://modelcontextprotocol.io/extensions/apps) (Claude, ChatGPT), two tools come with a view:

- `zensei_index_today` shows the regime card. Expand it to see the full dashboard, with each indicator's chart.
- `zensei_sectors_scan` shows the rotation map. Expand it to see the rankings, and open a sector to see its holdings.

The views call two app-only tools, `zensei_view_sector` and `zensei_view_indicators`. Apps hide them from the model.

## Resources

| URI | Content |
| --- | --- |
| `zensei://index/about` | The explainer as a markdown document. |
| `ui://zensei/index-card.html` | The Zensei Index view. |
| `ui://zensei/sector-map.html` | The sector map view. |

## Setup

### Claude

Open **Settings → Connectors → Add custom connector**. Paste `https://www.zensei.com/mcp`.

### ChatGPT

Turn on developer mode in ChatGPT's app settings, then create an app with the URL `https://www.zensei.com/mcp`.

### Claude Code

```sh
claude mcp add --transport http zensei https://www.zensei.com/mcp
```

### Cursor

Add this to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "zensei": {
      "url": "https://www.zensei.com/mcp"
    }
  }
}
```

### VS Code

Add this to `.vscode/mcp.json`:

```json
{
  "servers": {
    "zensei": {
      "type": "http",
      "url": "https://www.zensei.com/mcp"
    }
  }
}
```

### Any other client

Point the client at `https://www.zensei.com/mcp` with the Streamable HTTP transport.

## Plugin packages

| File | For |
| --- | --- |
| `plugin.json`, `mcp.json`, `assets/` | The ChatGPT plugin directory ([Agent Plugins](https://agent-plugins.org) format, OpenAI listing under `extensions.com.openai`). |
| `.claude-plugin/plugin.json`, `.mcp.json` | Claude Code plugins. |
| `.grok-plugin/plugin.json`, `.mcp.json` | Grok Build plugins. |

To build the ZIP for [platform.openai.com/plugins](https://platform.openai.com/plugins):

```sh
./scripts/package-openai.sh
```

The ZIP lands in `dist/zensei-chatgpt.zip`. [SUBMISSION.md](SUBMISSION.md) lists what each directory asks for.

## Registry metadata

- `server.json` follows the [official MCP Registry](https://registry.modelcontextprotocol.io) schema.
- `glama.json` claims the listing on [Glama](https://glama.ai/mcp/servers).

To publish to the official registry:

```sh
mcp-publisher login github
mcp-publisher publish
```

## Limits

- US markets only.
- Not investment advice. Zensei does not predict prices or place trades.

## License

MIT
