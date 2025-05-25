# nix-lemons

nix packages of **dubious** quality meant for x86_64-linux
(that could work for other systems)

## packages

| name                       | description                                 |
|----------------------------|---------------------------------------------|
| betacraft-launcher-bin     | https://betacraft.uk/                       |
| chicago95                  | https://github.com/grassmunk/Chicago95      |
| cursed_font                | https://tilde.team/~kiedtl/projects/cursed/ |
| kaledis                    | https://github.com/nix-community/naersk     |
| laigter                    | https://github.com/azagaya/laigter/         |
| middle-mann-fonts          | https://github.com/Vexcenot/-middle-mann/   |
| uzura                      | https://azukifont.com/font/uzura.html       |

## installation

in your `flake.nix`, add this flake into the inputs.

```nix
{
    inputs = {
        nix-lemons.url = "github:conductorpepper/nix-lemons"; # the nixpkgs input can be followed
    };
}
```

afterward, you can add some packages to `environment.systemPackages` or `home.packages`

```nix
{pkgs, inputs, ...}: {
    environment.systemPackages = [
        inputs.nix-lemons.packages.${pkgs.stdenv.hostPlatform.system}.<name>
    ];
}
```

you can try the packages with the following command (given the nix cli):

```bash
nix shell github:conductorpepper/nix-lemons#<name>
```

if it is executable (i.e., betacraft and laigter), you can use this to run it automatically (given the nix cli):

```bash
nix run github:conductorpepper/nix-lemons#<name>
```
