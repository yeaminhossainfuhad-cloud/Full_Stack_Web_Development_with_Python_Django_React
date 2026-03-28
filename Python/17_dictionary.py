# {}
# Key Value Pair

a = {"Rahim" : 12, "Karim" : 14, "Fahim" : 78, 1 : [1,2,3], 2 : [3,4,5]}
print (a) ; print(type(a))

print(a.keys(), a.values())

print("---------------")

for k,v in a.items():
    print(f"Key : {k}, Value : {v}")

print("---------------")

a = [1,2,3]
b= ["Mango", "Banana", "Apple"]

c = dict(zip(a,b))
print(c)

print(c[1])