#functions

def addOne(Number) :
    Number = Number + 1
    return Number


var = 0
print(var)
var2 = addOne(var)
var3 = addOne(var2)
var4 = addOne(5.5+4.5)
print (var2)
print (var3)
print (var4)


def addOneAddTwo(Numberone,NumberTwo) :
    Output = Numberone + 1
    #    Output = Output + NumberTwo + 2 
    Output += NumberTwo + 2 
    return Output

Sum = addOneAddTwo (1,2)

print (Sum)
