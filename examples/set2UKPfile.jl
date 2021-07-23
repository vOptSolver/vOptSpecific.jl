# =======================================================================
# 2KP

using vOptSpecific

# ==========================================
# instance

id = load2UKP("../examples/2KP500-1A.DAT")

# ==========================================

z1, z2, w, solutions = vSolve(id)

for i = 1:length(z1)
    println("(" , z1[i], " | ", z2[i], ") : ", solutions[i,:])
end
