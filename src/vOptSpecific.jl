module vOptSpecific

const libLAPpath = joinpath(@__DIR__, "..", "deps", "libLAP.so")
const libUMFLPpath = joinpath(@__DIR__, "..", "deps", "libUMFLP.so")
const libcomboPath = joinpath(@__DIR__,"..","deps","libcombo.so")

include("LAP.jl")
include("UMFLP.jl")
include("jMOScheduling.jl")
include("Bi01KP/Bi01KP.jl")

load2KP, set2KP = Bi01KP.loadKP, Bi01KP.problem
vSolve(pb::Bi01KP.problem, output=true) = Bi01KP.solve(pb, output)

export vSolve,
    load2LAP, set2LAP, LAP_Przybylski2008,
    load2OSP, set2OSP, OSP_VanWassenhove1980, generateHardInstance,
    load2UMFLP, set2UMFLP, UMFLP_Delmee2017,
    load2KP, set2KP


__init__() = (!isfile(libLAPpath) || !isfile(libUMFLPpath)) || !isfile(libcomboPath) && Pkg.build("vOptSpecific")

end # module
