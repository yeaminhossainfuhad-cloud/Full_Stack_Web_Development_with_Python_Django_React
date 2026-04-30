import functools

# anonymous function ---> Unnamed

def square(x):
    return x*x
print(square(5))

# lambda arguments : expression

square = lambda x : x*x
print(square(4))

add = lambda a,b : a+b
print(add(1,2))

students = [('Rahim', 60), ('Karim', 49), ('Fahim', 100)]
sorted_students = sorted(students,key= lambda x: x[1])
print(sorted_students)

# map()
nums = [1,2,3,4]
sq_nums = list(map(lambda x : x*x, nums))
print(sq_nums)

# filter ()
even = list(filter(lambda x : x%2 == 0, nums))
print(even)

# reduce()
sum = functools.reduce(lambda x,y : x+y, nums)
print(sum)