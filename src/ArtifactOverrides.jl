module ArtifactOverrides

if !Sys.iswindows()
    if Sys.islinux()
        if occursin("Arch Linux",read(`lsb_release -d`,String))
            include("arch.jl")
        end
    end
end

end # module ArtifactOverrides
