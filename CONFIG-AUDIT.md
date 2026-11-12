# Mac config audit — 2026-11-12

Observed directly from this Mac, not an application inventory. Capture time and
byte hashes are in `audit/2026-11-12/inventory.json`; import provenance is in
`audit/2026-11-12/imports.json`. Presence of a config does not prove the software
is installed, running, or still used. No live home config was changed.

## Existing repo configs

| Config | Result | Meaning |
| --- | --- | --- |
| `.config/herdr/config.toml` | Identical | No drift |
| `.tmux.conf` | Identical | TPM, tmux-sensible, tmux-resurrect already declared; their directories exist locally |
| `.vimrc` | Different | Mac comments out YouCompleteMe and Syntastic; corresponding plugin directories are absent |
| `.zshrc` | Different | Mac enables fzf, adds Java/Python/npm/pnpm/Antigravity/OpenCode paths, tool aliases, Claude model routing, SSH agent startup, and keyboard protocol reset |
| `.oh-my-zsh/oh-my-zsh.sh` | Different | 113-line repo loader versus 347-line Mac loader; framework implementation, not personal settings |

Full pre-update diffs are under `audit/2026-11-12/`. Following explicit user
approval, `.zshrc`, `.vimrc`, and `.oh-my-zsh/oh-my-zsh.sh` were replaced with
the Mac versions. AeroSpace also matches the Mac exactly. The table above records
the initial audit, not the post-update state.

The repo's consecutive `plugins=(git)` and `plugins=(node)` assignments replace
the first list: it effectively selects node. The Mac selects git. This is a
configuration difference, not evidence of an additional installed shell plugin.
The only custom Oh My Zsh plugin directory observed is `example`.

Portability caveat for the copied shell config: it contains machine-specific
paths and starts an SSH agent per shell. The Mac also no longer sources
`.bash_profile`, which is absent. Those choices merit review before a merge.
Framework caveat for the copied Oh My Zsh loader: a single loader is not a
complete framework installation, and its changes have not been attributed to
upstream versus local edits.

## Added configs and software

| Paths | Software / purpose | Import |
| --- | --- | --- |
| `.aerospace.toml` | AeroSpace window manager; starts `borders` for window borders | Exact |
| `.gitconfig`, `.config/git/ignore` | Git identity and global ignore patterns | Exact; contains personal name/email |
| `.npmrc` | npm global install prefix | Exact |
| `.zprofile` | Zsh login setup for Homebrew at `/opt/homebrew` | Exact; Apple Silicon path |
| `.config/gh/config.yml` | GitHub CLI preferences and `co` alias | Exact; excludes `hosts.yml` |
| `.config/opencode/{opencode.jsonc,cli.json,package.json}` | OpenCode permissions, UI, plugin package dependency | Exact; package declares `@opencode-ai/plugin` 1.15.9 |
| `.config/billion-context/billion-context.json` | billion-context provider settings | Exact; empty providers |
| `.config/openspec/config.json` | OpenSpec workflow preferences | Telemetry object removed |
| `.pi/agent/{settings,keybindings}.json` | Pi theme, models, keys, package list | Exact |
| `.gemini/settings.json` | Gemini CLI authentication method preference | Exact; no OAuth credentials |
| `.claude/settings.json` | Claude Code plugins, marketplace sources, permissions, hooks | Exact; absolute paths retained |
| `.claude/statusline-command.sh` | Claude status line | Exact; requires jq and Git |
| `.claude/hooks/herdr-agent-state.sh` | Claude/herdr session integration | Exact; generated and managed by herdr |
| `.codex/config.toml` | Codex model, sandbox/approval preferences, plugins, git marketplace sources, features | Filtered export |
| `.codex/hooks.json`, `.codex/herdr-agent-state.sh` | Codex/herdr session integration | Exact; hook script managed by herdr |

Claude settings enable caveman, codex, and superpowers. Pi lists pi-web-access,
pi-subagents, pi-plugin-manager, and billion-context. The filtered Codex config
records enabled plugins and git marketplace origins; it omits runtime-managed
local marketplaces. It is a portable subset for review, not a full replacement
for the live Codex config. Hook paths still reference `/Users/lshi`; restore
requires that home path or deliberate adaptation. Herdr can overwrite its scripts.

## Excluded or deferred

- Credentials / private topology: SSH config and keys, GitHub `hosts.yml`,
  last30days `.env`, Claude router config, Orbi MCP config, Docker config,
  Claude global state, Gemini/Pi/Codex auth. Codex has a credential field inside
  its otherwise useful config: its entire environment override section was
  excluded, along with project trust, hook hashes, generated runtime/MCP paths,
  UI state, and local marketplaces. Raw credential-bearing files were not saved.
- Histories, logs, databases, sockets, sessions, browser profiles, downloads,
  model weights, caches, backups, and installation receipts are runtime data.
- `.config/iterm2` contains AppSupport and sockets; no direct preference file
  was found there. Preferences elsewhere in `~/Library` were not audited.
- Installed skills, agent definitions, commands, plugin registries and lockfiles
  need a separate dependency/provenance audit. Their source trees were not copied.
  Therefore this is not a complete backup of AI tool customizations.
- Pi model definitions, OpenCode service settings, and other MCP/provider configs
  remain deferred pending focused review; config presence alone is not enough to
  classify them as safe or portable.

## Keeping it current — proposed workflow

Use an explicit manifest of config paths and software names. Keep this ordinary
checkout as the review surface; copy approved settings into it and inspect Git
diffs. The README describes a bare-repo workflow, but this checkout is an ordinary
repo and local configs are regular files, not symlinks into this checkout.
That establishes drift today; it does not prove whether another bare repo exists.

A future read-only audit command should inventory only home dot entries and
bounded config directories, save metadata before comparing bytes, and report
`same`, `changed`, `missing-on-mac`, or `new-candidate`. Never auto-import a new
directory. Credentials and generated data require explicit exclusions; filtered
exports must compare with the same projection rather than full source bytes.

Prefer this over full-home tracking (too much state and secret exposure) or
automatic bidirectional synchronization (unclear overwrite direction). Symlink
management can come later if desired; it changes live files and needs a separate
dry run and approval. No scheduler, restore command, or synchronization script
has been installed. The three original differences have been imported at the user’s request.
A reusable drift checker remains proposed work.
