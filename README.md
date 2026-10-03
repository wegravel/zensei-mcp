# Zensei Index MCP server

A public, read-only [MCP](https://modelcontextprotocol.io) server for the [Zensei Index](https://www.zensei.com).

The Zensei Index is a 0-100 risk score for the US stock market. **Lower is healthier.**

- **URL:** `https://www.zensei.com/mcp`
- **Transport:** Streamable HTTP
- **Auth:** none
- **Docs:** <https://www.zensei.com/mcp>

This repository holds the server metadata only. The server runs on zensei.com.

## Tools

| Tool | Returns |
| --- | --- |
| `zensei_index_about` | What the index is, how to read the 0-100 score, and how it is built. |
| `zensei_index_today` | Today's final score, its regime label, and the three layer scores: structural, filter, confirmation. |
| `zensei_index_indicators` | The ten indicators behind the score, each with its status, group, weight, and explanation. |
| `zensei_index_summary` | The latest written market summary, with its date and a stale flag when it is more than three days old. |

## Resources

| URI | Content |
| --- | --- |
| `zensei://index/about` | The explainer as a markdown document. |

## Setup

### Claude Code

```sh
claude mcp add --transport http zensei https://www.zensei.com/mcp
```

### Claude app

Open **Settings → Connectors → Add custom connector**. Paste `https://www.zensei.com/mcp`.

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

## Registry metadata

- `server.json` follows the [official MCP Registry](https://registry.modelcontextprotocol.io) schema.
- `glama.json` claims the listing on [Glama](https://glama.ai/mcp/servers).

To publish to the official registry:

```sh
mcp-publisher login github
mcp-publisher publish
```

## Limits

- Today's data only. No history.
- Not investment advice.

## License

MIT
