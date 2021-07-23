using vOptSpecific

n  =  3
C1 = [ 3  9  7 ; 16 10  6 ; 2  7 11]
C2 = [16 15  6 ;  5  7 13 ; 1  2 13]

myInstance = set2LAP( n , C1 , C2 )
algorithm = LAP_Przybylski2008( )
z1, z2, S = vSolve( myInstance , algorithm )

id = set2LAP(n, C1, C2)
z1,z2,solutions = vSolve(id)

for i = 1:length(z1)
    println("(" , z1[i], " | ", z2[i], ") : ", solutions[i,:])
end
