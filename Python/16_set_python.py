# {}
# Unordered
# Immutable
# No duplicates
# set()

a = [1,2,2,3,4,4,4,5]
s = set(a)
print(s)

# Intersection , Union
a = {1,2,3}
b = {2,3,4}

c = b.intersection(a)
print(f"Intersection : {c}")

d = a.union(b)
print(f"Union : {d}")