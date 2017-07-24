module vOptSpecific

export vSolve,
    load2LAP, set2LAP, LAP_Przybylski2008,
    load2OSP, set2OSP, OSP_VanWassenhove1980, generateHardInstance,
    load2UMFLP, set2UMFLP, UMFLP_Delmee2017
        #KP, solveKP, KP_Jorge2010

const libLAPpath = joinpath(@__DIR__, "..", "deps", "libLAP.so")
const libUMFLPpath = joinpath(@__DIR__, "..", "deps", "libUMFLP.so")

include("LAP.jl")
include("UMFLP.jl")
include("jMOScheduling.jl")
# include("KP.jl")

__init__() = (!isfile(libLAPpath) || !isfile(libUMFLPpath)) && Pkg.build("vOptSpecific")

end # module
