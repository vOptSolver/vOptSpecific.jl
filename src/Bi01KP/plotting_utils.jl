using PyPlot

function plot_X(X)
    p1 = [obj_1(x) for x in X]
    p2 = [obj_2(x) for x in X]

    xlabel("z1")
    ylabel("z2")
    PyPlot.plot(p1,p2,"bx")
    show()
end

function plot_X(X, XSE1m)
    p1 = [obj_1(x) for x in X]
    p2 = [obj_2(x) for x in X]

    pp1 = [obj_1(x) for x in XSE1m]
    pp2 = [obj_2(x) for x in XSE1m]

    title("Knapsack Julia")
    xlabel("z1")
    ylabel("z2")
    PyPlot.plot(p1,p2,"bx", pp1, pp2,"r.")
    show()
end

function plot_triangle(Δ::Vector{solution})
    points = unique([obj(x) for x in Δ])
    xlist = [x[1] for x in points]
    ylist = [x[2] for x in points]
    xnadir = [min(xlist[i], xlist[i+1]) for i = 1:length(xlist)-1]
    ynadir = [min(ylist[i], ylist[i+1]) for i = 1:length(ylist)-1]
    xdottedline, ydottedline = Int[], Int[]
    for i = 1:length(xnadir)
        push!(xdottedline, xlist[i]) ; push!(xdottedline, xnadir[i])
        push!(ydottedline, ylist[i]) ; push!(ydottedline, ynadir[i])
    end
    push!(xdottedline, xlist[end]) ; push!(ydottedline, ylist[end])

    plot(xlist, ylist, "bs")
    plot(xdottedline, ydottedline, "k--")
    plot(xnadir.+1, ynadir.+1, "g^")
    grid()
    show()
end

plot_triangle(Δ::Triangle) = plot_triangle(Δ.XΔ)
