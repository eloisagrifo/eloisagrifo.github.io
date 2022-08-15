restart
R = QQ[x,y,z]
M = R^3 --free module on 3 generators
I = ideal"xy,yz"
N = module I --viewing the ideal I as a module
--another way to define the same module:
--by noting it's a submodule of R^1, and
--writing it as the image of a map
phi = map(R^1,R^2,{{x*y,y*z}})
L = image phi
--finally, we can describe it by generators and relations:
psi = map(R^2,R^1,{{-z},{y}})
K = coker psi
