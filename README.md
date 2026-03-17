# cfgd-config

Machine configuration managed by [cfgd](https://github.com/tj-smith47/cfgd).

## Quick start

```bash
cfgd init --from <this-repo-url>
cfgd apply
```

## Structure

- `profiles/` — machine profiles (which modules, packages, env, system settings to apply)
- `modules/` — self-contained configuration units (packages, files, env, scripts)
- `cfgd.yaml` — config root (active profile, sources, theme)
