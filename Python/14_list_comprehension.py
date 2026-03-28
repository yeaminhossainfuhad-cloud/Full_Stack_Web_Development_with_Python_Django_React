a = [1,10,23,24,26,90]

result =[]

for i in a :
    if i % 2 == 0:
        result.append(i)

print(result)

# List Comprehension

res = [i for i in a if i % 2 == 0]
print(res)

print("------------------------------")


b = [1,2,3,4,5,6,7,8,9,10]

b_new = [i**2 if i % 2 ==0 else i for i in b]
print(b_new)