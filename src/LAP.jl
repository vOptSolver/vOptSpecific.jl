type _2LAP
    nSize::Int
    C1::Matrix{Int}
    C2::Matrix{Int}
end

set2LAP(n::Int, c1::Matrix{Int}, c2::Matrix{Int}) = begin
    if !(size(c1,1) == size(c1, 2) == size(c2,1) == size(c2 , 2) == n)
        error("dimensions incorrectes")
    end
    _2LAP(n, c1, c2)
end
set2LAP(c1::Matrix{Int}, c2::Matrix{Int}) = _2LAP(size(c1,1), c1, c2)

type LAPsolver
    parameters
    solve::Function#::Function(id::_2LAP) -> ...
end

function vSolve(id::_2LAP, solver::LAPsolver = LAP_Przybylski2008())
    solver.solve(id)
end

function LAP_Przybylski2008()::LAPsolver
    mylibvar = joinpath(LIBPATH,"libLAP.so")

    f = (id::_2LAP) -> begin 
        nSize, C1, C2 = Cint(id.nSize), reshape(convert(Matrix{Cint}, id.C1), Val{1}), reshape(convert(Matrix{Cint}, id.C2), Val{1})
        p_z1,p_z2,p_solutions,p_nbsolutions = Ref{Ptr{Cint}}() , Ref{Ptr{Cint}}(), Ref{Ptr{Cint}}(), Ref{Cint}()
        @eval ccall(
            (:solve_bilap_exact, $mylibvar),
            Void,
            (Ref{Cint},Ref{Cint}, Cint, Ref{Ptr{Cint}}, Ref{Ptr{Cint}}, Ref{Ptr{Cint}}, Ref{Cint}),
            $C1, $C2, $nSize, $p_z1, $p_z2, $p_solutions, $p_nbsolutions)
        nbSol = p_nbsolutions.x
        z1,z2 = convert(Array{Int,1},unsafe_wrap(Array, p_z1.x, nbSol, true)), convert(Array{Int,1},unsafe_wrap(Array, p_z2.x, nbSol, true))
        solutions = convert(Array{Int,2},reshape(unsafe_wrap(Array, p_solutions.x, nbSol*id.nSize, true), (id.nSize, nbSol)))
        return z1, z2, solutions'
    end

    return LAPsolver(nothing, f)
end

function load2LAP(fname::AbstractString)
    f = open(fname)
    n = parse(Int,readline(f))
    C1 = Matrix{Int}(n,n)
    C2 = Matrix{Int}(n,n)
    for i = 1:n
        C1[i,:] = map(parse,split(chomp(readline(f)), ' ', keep=false))
    end
    for i=1:n
        C2[i,:] = map(parse,split(chomp(readline(f)), ' ', keep=false))
    end
    return _2LAP(n, C1, C2)
end