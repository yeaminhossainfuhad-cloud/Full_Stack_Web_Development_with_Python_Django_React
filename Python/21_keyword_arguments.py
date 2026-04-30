def my_fun(f_name,l_name,age):
    print(f"My name is {f_name} {l_name}. And Im {age} years old.")

my_fun("Rahim","Khan",25)
my_fun(age=25,l_name="Khan",f_name="Karim")


#Arbitary Number of keyword arguments
def fun(**kwargs):
    print(kwargs)
    print(f"My name is {kwargs["F_name"]} {kwargs["L_name"]}. And Im {kwargs["Age"]} years old. I live in {kwargs["Address"]}. I got {kwargs["Marks"]} in programming.")

fun(Age=25, L_name="Khan", F_name="Samim", Marks = 95, Address = "Dhaka")