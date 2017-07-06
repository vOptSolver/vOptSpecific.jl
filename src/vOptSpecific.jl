module vOptSpecific

export vSolve,
    load2LAP, set2LAP, LAP_Przybylski2008,
    load2OSP, set2OSP, OSP_VanWassenhove1980, generateHardInstance
        #KP, solveKP, KP_Jorge2010

const libLAPpath = joinpath(@__DIR__, "..", "deps", "libLAP.so")

include("LAP.jl")
include("jMOScheduling.jl")
# include("KP.jl")

__init__() = !isfile(libLAPpath) && Pkg.build("vOptSpecific")

end # module
