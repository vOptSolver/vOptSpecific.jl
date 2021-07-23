# =======================================================================
# 2UMFLP

using vOptSpecific


# ==========================================
# instance

id = load2UMFLP("../examples/F50-51.txt")


# ==========================================
# vOptSpecific : UMFLP_Delmee2017

Z1, Z2, Y, X, isEdge = vSolve(id)

for i = 1:length(z1)
    println("(" , Z1[i], " | ", Z2[i], ") ")
end
