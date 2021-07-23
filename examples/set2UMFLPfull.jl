# =======================================================================
# 2UMFLP

using vOptSpecific


# ==========================================
# instance

n   = 3 # facilities
m   = 7 # customers
ca1 = [9 27 24; 34 9 34; 11 12 17; 14 9 13; 16 26 28; 82 95 49; 20 17 9]
ca2 = [34 9 34; 14 9 13; 20 17 9; 9 27 24; 11 12 17; 16 26 28; 82 95 49]
cr1 = [30, 30, 30]
cr2 = [12, 45, 25]

# ==========================================
# vOptSpecific : test 0 : UMFLP_Delmee2017

myInstance = set2UMFLP(  m , n, ca1, ca2, cr1, cr2 )
algorithm = UMFLP_Delmee2017()
Z1, Z2, Y, X, isEdge = vSolve( myInstance , algorithm )

for i = 1:length(z1)
    println("(" , Z1[i], " | ", Z2[i], ") ")
end
 
