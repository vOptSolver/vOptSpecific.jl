module vOptSpecific

export vSolve,
    load2LAP, set2LAP, LAP_Przybylski2008,
    load2OSP, set2OSP, OSP_VanWassenhove1980, generateHardInstance
        #KP, solveKP, KP_Jorge2010

const LIBPATH = joinpath(dirname(@__FILE__),"..","deps")


include("LAP.jl")
include("jMOScheduling.jl")
# include("KP.jl")


end # module
