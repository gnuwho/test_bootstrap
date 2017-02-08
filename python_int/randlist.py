import random

def randomList(a):
    b = []
    for i in range(len(a)):
        element = random.choice(a)
        a.remove(element)
        b.append(element)
    return b 


this = [8,232,1414,524523,23423411,234234555,1231,123123,123123123,1231231231321]
print randomList(this)
