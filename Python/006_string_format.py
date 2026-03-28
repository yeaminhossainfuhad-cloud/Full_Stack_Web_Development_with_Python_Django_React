age = int(input("Enter your age : "))
f_name = input("Enter your First Name : ")
l_name = input("Enter your Last Name : ")

txt = "I am {f_name} {l_name}. I am {age} years old.".format(l_name=l_name, f_name=f_name, age=age)
print(txt)

txt1 = f"I am {f_name} {l_name}. I am {age} years old."
print(txt1)