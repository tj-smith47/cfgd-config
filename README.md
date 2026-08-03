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

## Working on this repo

Every manifest here is parsed by cfgd itself before it lands, so a typo or a
stray key fails locally instead of on the next `cfgd apply`.

```bash
task validate                    # parse cfgd.yaml, every profile, every module
task plan                        # preview what applying this config would change
git add modules/nvim
task commit -- -m 'fix(nvim): …' # validate, then commit
task push                        # validate, then push (clean tree required)
```

`task commit:quick` skips the gate for the rare case where validation is
blocked by something unrelated to the staged change.
