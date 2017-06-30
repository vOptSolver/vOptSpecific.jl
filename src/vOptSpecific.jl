module vOptSpecific

export load2LAP, set2LAP, vSolve, LAP_Przybylski2008 
        #KP, solveKP, KP_Jorge2010

const LIBPATH = joinpath(dirname(@__FILE__),"..","deps")


include("LAP.jl")
# include("KP.jl")


end # module
