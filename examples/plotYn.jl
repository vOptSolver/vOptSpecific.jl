# Example on how to plot Y_N for a bi-objective discrete optimization case
# July 2017

using PyPlot

title(L"$Y_N$")
xlabel(L"$z_1$")
ylabel(L"$z_2$")

vMax=ceil(Int,max(maximum(z1),maximum(z2))*1.1)
axis([0, vMax, 0, vMax])
plot( z1, z2, color="green", linestyle="", marker="o", label="YN" )
