--Operations on lists
--List are indicated by {}, 
--with elements separated by commas
L = {7,42,1}
--To read the ith entry, type L_i
--note that the first entry is the 0th entry
L_0
L_1
L_2
L_3--there is no such thing

--how long is a list?
#L

--To apply a function to all the members of a list
apply(L,even)
?even
--we can define a function by using a dummy variable of our choosing followed by ->
apply(L, i -> 2*i-1)

--we can also select which elements of a list have a certain property
--more precisely: we need a boolean (function that returns true or false)
select(L, even)
select(L, i -> 2*i-1 == 83)

--there are many other functions we can apply to lists
viewHelp "List"
