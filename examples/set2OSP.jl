n =4 
p = [2, 4, 3, 1]
d = [1, 2, 4, 6]
r = [0, 0, 0, 0]
w = [1, 1, 1, 1]

using vOptSpecific

id = set2OSP(n, p, d, r, w)
z1, z2 , S = vSolve(id)