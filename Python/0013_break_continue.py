a = [1,2,3,4,"a",5,6]

for i in a :
    if type(i) == type("b"):
        break
    else:
        print(i)

print("------------------------------")
    
for i in a :
    if type(i) == type("b"):
        continue
    else :
        print(i)