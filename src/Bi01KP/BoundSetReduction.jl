function bound_set_reduction!(mp::mono_problem, Δ::Triangle, output::Bool)
    pb0 = Δ.XΔ[1].pb
    rpb = copy(pb0)

    @assert isempty(intersect(union(mp.C0,mp.C1), union(rpb.C0, rpb.C1)))

    for i in mp.C1
        fix_1!(rpb, i)
    end
    for i in mp.C0
        fix_0!(rpb, i)
    end

    X = first_phase(rpb)

    originsize = size(rpb)
    
    for v in copy(variables(rpb))
        if rpb.ω + rpb.w[v] <= rpb.c
            fix_1!(rpb, v)

            X = first_phase(rpb)

            segments = solution[]
            i = 1
            while i < length(X) && obj_1(X[i+1]) <= obj_1(Δ.XΔ[1])
                i += 1
            end
            while i <= length(X) && obj_2(X[i]) >= obj_2(Δ.XΔ[end])
                push!(segments, X[i])
                i += 1
            end
            if 1 < i <= length(X) && obj_2(X[i-1]) > obj_2(Δ.XΔ[end])
                push!(segments, X[i])
            end

            @assert issorted(segments, by = obj, lt = lexless)

            dominated = false
            if length(segments) == 0
                dominated = true
            elseif length(segments) == 1
                dominated = all(x -> x >= segments[1], Δ.XΔ)
            else
                nadirs = [(obj_1(Δ.XΔ[i])+1, obj_2(Δ.XΔ[i+1])+1) for i = 1:length(Δ.XΔ)-1]
                for n in nadirs
                    dominated = false
                    for i = 1:length(segments)-1
                        xr, xs = segments[i], segments[i+1]
                        λ1, λ2 = obj_2(xr)-obj_2(xs), obj_1(xs)-obj_1(xr)
                        if λ1*obj_1(xr)+λ2*obj_2(xr) < λ1*n[1]+λ2*n[2]
                            dominated = true ; break
                        end
                    end
                    dominated == false && break
                end
            end
        
            unfix_1!(rpb, v)
            if dominated
                fix_0!(rpb, v)
            end
        else
            fix_0!(rpb, v)
        end
    end

    for v in copy(variables(rpb))
        fix_0!(rpb, v)

        # println("trying with variable $v set to 0")
        X = first_phase(rpb)

        segments = solution[]
        i = 1
        while i < length(X) && obj_1(X[i+1]) <= obj_1(Δ.XΔ[1])
            i += 1
        end
        while i <= length(X) && obj_2(X[i]) >= obj_2(Δ.XΔ[end])
            push!(segments, X[i])
            i += 1
        end
        if 1 < i <= length(X) && obj_2(X[i-1]) > obj_2(Δ.XΔ[end])
            push!(segments, X[i])
        end

        @assert issorted(segments, by = obj, lt = lexless)

        dominated = false
        if length(segments) < 1
            dominated = true
        elseif length(segments) == 1
            dominated = all(x -> x >= segments[1], Δ.XΔ)
        else
            nadirs = [(obj_1(Δ.XΔ[i])+1, obj_2(Δ.XΔ[i+1])+1) for i = 1:length(Δ.XΔ)-1]
            for n in nadirs
                dominated = false
                for i = 1:length(segments)-1
                    xr, xs = segments[i], segments[i+1]
                    λ1, λ2 = obj_2(xr)-obj_2(xs), obj_1(xs)-obj_1(xr)
                    if λ1*obj_1(xr)+λ2*obj_2(xr) < λ1*n[1]+λ2*n[2]
                        dominated = true ; break
                    end
                end
                dominated == false && break
            end
        end
    
        unfix_0!(rpb, v)
        if dominated
            fix_1!(rpb, v)
        end
    end

    for v in rpb.C0
        (v in mp.variables) && fix_0!(mp, v)
    end
    for v in rpb.C1
        (v in mp.variables) && fix_1!(mp, v)
    end
    output && println("Further reduction from $originsize to $(size(mp)) variables")

end