
# generate Overrides.toml

function write_overrides(ors)
    open("$(ENV["HOME"])/.julia/artifacts/Overrides.toml","w") do f
        write(f,prod(ors))
    end
end

if !Sys.iswindows()
    if Sys.islinux()
        if occursin("Arch Linux",read(`lsb_release -d`,String))
            # /usr/
            include("../src/arch.jl")
            ors = ["[$(pkg.first)]\n$(pkg.second) = \"/usr/\"\n\n" for pkg ∈ pkgs]
            write_overrides(ors)
        end
    end
end
