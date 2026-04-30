def add(a,b):
    res = a+b
    return res
r = add(12,10)
print(r)


def Add(*args):
    print(args)
    return sum(args)
res = Add(10,12,20,40)
print(res)