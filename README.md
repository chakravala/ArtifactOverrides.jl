# ArtifactOverrides.jl

*Build ~/.julia/artifacts/Overrides.toml for operating system*

Instead of depending on [artifacts](https://pkgdocs.julialang.org/v1/artifacts) downloaded by the Julia language package manager, this package links artifacts to the operating system binaries by building the necessary `~/.julia/artifacts/Overrides.toml` file for detected operating systems.
This makes it easier to maintain and share consistent binary artifact interoperability with an operating system.

Currently supported operating systems: `Arch Linux`.

**Usage**: Clear the `~/.julia/artifacts` directory, then run
```julia
pkg> build ArtifactOverrides
```
Note that it seems to be necessary to clear the directory first, otherwise the downloaded artifacts may still be linked instead of the operating system binaries.
When loading a package depending on an artifact linked to the operating system, an error may occur because the operating system installation is missing the linked binary.
Such an error may be fixed by installing the necessary package to the operating system.

**Maintenance**: For `Arch Linux` it is currently sufficient that the path is simply redirected to `/usr/`, so this package `build.jl` script merely iterates through `pkgs` maintained in `src/arch.jl` having the format `"$(uuid)"=>"$(name)"` per element.

**Future work**: The initial list of artifacts linked to operating systems binaries is not complete, it will be updated and revised over time.
Additional operating systems will not be supported unless there are contributors who wish to initialize or maintain a list of artifacts linked to that operating system.
