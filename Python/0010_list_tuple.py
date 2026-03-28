# List
a = [1,2,3,"Naim", "Fahim", 8.9, 3.4]
print(a); print(type(a))

# list is mutable
a[0] = 100
print(a)
print(a[-1])
print(len(a))
a.append([6,7,8])
print(a)
print(a.index(3))
a.reverse()
print(a)


s = "Hello"
print(list(s))


print("---------------------------------------------------")

# Tuple. Tuple is immutable

t = (1,2,3)
print(t) ; print(type(t))

# t[0] = 100
t_r = tuple(reversed(t))
print(t)
print(t_r)