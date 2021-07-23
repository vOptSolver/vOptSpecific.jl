

using vOptSpecific

id = load2OSP( "2osp04.dat" )
solver = OSP_VanWassenhove1980( )
z1, z2 , S = vSolve( id , solver )
