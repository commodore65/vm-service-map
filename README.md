# VM Service Map

> Turn your server into a professional PDF document with a single Claude Code prompt.

Paste the prompt into Claude Code, answer a few questions, and get a beautifully designed **VM Service Map** PDF — automatically discovering your services via SSH.

## What It Does

1. **Asks your preferences** — theme, server info, SSH access
2. **Discovers services** — connects via SSH, finds running systemd units, open ports, dependencies
3. **Generates a PDF** — multi-page document with overview, service cards, dependency map, and quick reference

## Themes

| # | Theme | Look |
|---|-------|------|
| 1 | `midnight` | Dark navy, neon accents |
| 2 | `clean-light` | White, minimalist |
| 3 | `nord` | Cool blue-gray |
| 4 | `solarized` | Warm dark tones |
| 5 | `monokai` | Dark + vivid neon |
| 6 | `paper` | Cream/paper tone, print-friendly |

## Requirements

- [Claude Code](https://claude.ai/claude-code) with `react-pdf` skill installed
- SSH access to your server (or you can provide service info manually)
- Node.js + pnpm/npm (for PDF generation dependencies)

## Usage

1. Open Claude Code
2. Paste the contents of [`vm-service-map-prompt.md`](vm-service-map-prompt.md)
3. Answer the questions (theme, server info, SSH access)
4. Get your PDF

## Setup (Optional)

If you want to pre-install the PDF generation dependencies:

```bash
./setup.sh
```

This installs `react`, `@react-pdf/renderer`, and `tsx` in a working directory.

## PDF Structure

- **Page 1 — Overview**: Server info, stats badges, infrastructure, ports, service categories
- **Page 2+ — Service Details**: Grouped service cards with runtime, framework, database, dependencies
- **Last Page — Reference**: External dependency map, deploy flow, quick reference commands

## How It Works

The prompt guides Claude Code through a step-by-step interactive flow:

```
Theme Selection → Server Info → SSH Discovery → Data Review → PDF Generation
```

Claude connects to your server, runs discovery commands (`systemctl`, `ss`, package checks), analyzes `requirements.txt` / `package.json` / `pyproject.toml` files, and generates a React-PDF document with all the collected data.

## License

MIT
