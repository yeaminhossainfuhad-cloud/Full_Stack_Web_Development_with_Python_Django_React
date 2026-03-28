# no input, no return
def my_first_function():
    a = 10
    b = 12
    print(a+b)

my_first_function()

# input, no return
def add (a,b):
    print(a+b)

add(5,10)
add(15,10)

# input, return
def multiply(a,b):
    return a*b

res = multiply(12,2)
print(res)

# no input, return
def hello():
    return "Hello"

greetings = hello()
print(greetings)