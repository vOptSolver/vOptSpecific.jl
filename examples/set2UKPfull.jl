# =======================================================================
# 2KP

using vOptSpecific

# ==========================================
# instance

n  = 3
p1 = [ 3,  9 , 7]
p2 = [16, 15 , 6]
w  = [ 2,  3 , 4]
c  = 8

# ==========================================

myInstance = set2UKP( n , p1 , p2 , w , c )
algorithm = UKP_Jorge2010()
z1, z2, r, x = vSolve( myInstance , algorithm )

for i = 1:length(z1)
    println("(" , z1[i], " | ", z2[i], ") : ", x[i,:])
end
