# MIT License
# Copyright (c) 2017: Xavier Gandibleux, Anthony Przybylski, Gauthier Soleilhac, and contributors.
const Arc = Pair{vertex,vertex}

immutable List{T}
   head::T
   tail::List{T}

   List{T}() where T = new{T}()
   List(a, l::List{T}) where T = new{T}(a, l)
end

List(T) = List{T}()
List() = List(Any)

Base.isempty(x::List) = !isdefined(x,2)

head(a::List) = a.head
tail(a::List) = a.tail

Base.start(l::List) = l
Base.done(l::List, state::List) = isempty(state)
Base.next(l::List, state::List) = (state.head, state.tail)

function reverse(l::List{T}) where T
    l2 = List(T)
    for h in l
        l2 = List(h, l2)
    end
    l2
end

immutable Partition
    v::vertex
    arcs::List{Arc}
    nbArcs::UInt16
    zλ::Int
    z1::Int
    z2::Int
end
<(a::Partition, b::Partition) = a.zλ < b.zλ || a.zλ == b.zλ && a.nbArcs < b.nbArcs #Used to sort the binary heap of Partitions
Base.isless(a::Partition, b::Partition) = a.zλ < b.zλ || a.zλ == b.zλ && a.nbArcs < b.nbArcs #Used to sort the binary heap of Partitions
# Base.isless(a::Partition, b::Partition) = a.zλ < b.zλ || (a.zλ == b.zλ && a.z1 <= b.z1 && a.z2 <= b.z2) #Used to sort the binary heap of Partitions
# <(a::Partition, b::Partition) = a.zλ < b.zλ || (a.zλ == b.zλ && a.z1 <= b.z1 && a.z2 <= b.z2) #Used to sort the binary heap of Partitions
zλ(p::Partition) = p.zλ
z1(p::Partition) = p.z1
z2(p::Partition) = p.z2

Partition(v::vertex) = Partition(v, List(Arc), 0, v.zλ, v.z1, v.z2)

#Reconstruct a solution from a Partition

function solution(l, pb::problem, mono_pb::mono_problem) 
    vars = falses(size(pb))
    obj1, obj2, w = mono_pb.min_profit_1, mono_pb.min_profit_2, mono_pb.ω

    #TODO :
    #variables in l should be sorted by decreasing profit of the mono_problem,
    #the first pass should be doable in O(n) instead of O(n^2)
    #Variables in C1 could be sorted after the reduction to make the second pass in O(n) too

    for i in l
        vars[findfirst(pb.variables, i)] = true
        obj1 += pb.p1[i]
        obj2 += pb.p2[i]
        w += pb.w[i]
    end

    for v in mono_pb.C1
        vars[findfirst(pb.variables, v)] = true
    end

    res = solution(pb, vars, obj1 - pb.min_profit_1, obj2 - pb.min_profit_2, w - pb.ω)
    # @assert dot(pb.p1, res.x, pb.variables) + pb.min_profit_1 == obj_1(res)
    # @assert dot(pb.p2, res.x, pb.variables) + pb.min_profit_2 == obj_2(res)
    return res
end


function zλ(a::Arc)
    s = first(a)
    t = last(a)
    return s.w == t.w ? 0 : s.mono_pb.p[s.i]
end

function z1(a::Arc)
    s = first(a)
    t = last(a)
    return s.w == t.w? 0 : s.pb.p1[s.i]
end

function z2(a::Arc)
    s = first(a)
    t = last(a)
    return s.w == t.w ? 0 : s.pb.p2[s.i]
end

function weight(a::Arc)
    s = first(a)
    t = last(a)
    return t.w - s.w
end


#For debugging
function zλ(l::List{Arc})
    z = zλ(first(head(l)))
    for arc in l
        z += zλ(arc)
    end
    z
end

function z1(l::List{Arc})
    z = z1(first(head(l)))
    for arc in l
        z += z1(arc)
    end
    z
end

function z2(l::List{Arc})
    z = z2(first(head(l)))
    for arc in l
        z += z2(arc)
    end
    z
end



# Base.show(io::IO, a::Arc) = print(io, a.first, " =>+",length(a),"=> ", a.second)
Base.show(io::IO, a::Arc) = print(io, a.first, " =>+",length(a),",",z1(a),",",z2(a),"=> ", a.second)