immutable mono_solution
    pb::mono_problem
    x::BitArray
    obj::Int
    weight::Int
end

#Constructur : empty solution
# mono_solution(p::mono_problem) = mono_solution(p, falses(size(p)), 0, 0)

obj(s::mono_solution) = s.obj + s.pb.min_profit_λ
weight(s::mono_solution) = s.weight + s.pb.ω

#Print function
Base.show(io::IO, s::mono_solution) =
    print(io, "mono_sol(p=$(obj(s)), w=$(weight(s)))")

#Convert a mono_solution to a solution
solution(s::mono_solution) = begin 
    #@assert dot(s.pb.w, s.x, s.pb.variables) + s.pb.ω == weight(s)
    p = s.pb.pb

    C1 = s.pb.C1
    x = falses(size(p))

    for (i,v) = enumerate(s.pb.variables)
        s.x[i] && (x[findfirst(p.variables, v)] = true)
    end

    for v in s.pb.C1
        x[findfirst(p.variables, v)] = true
    end

    res = solution(
        p,
        x,
        dot(p.p1, x, p.variables),
        dot(p.p2, x, p.variables),
        weight(s) - p.ω)
    #@assert weight(res) == dot(p.w, res.x, p.variables) + p.ω
    return res
end