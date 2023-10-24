# # # a="Gaurav"
# # # # print(dir(a)) # char
# # # print(a.count("a"))
# # # print(a.find("v"))

# # # # indexing and slicing
# # # print(a[0])

# # # print(dir(str))

# # # a="India"
# # # b="is great"
# # # print(a+b)
# # # print(str.__add__(a,b))
# # # print(len(a))
# # # print(str.__len__(a))

# # #boolean True, False

# # # is_a_repo=True

# # #complex data type

# # # a = 10+20j

# # # print(type(a))

# # # int, float, str, bool, complex => primitive data types in python

# # # collection data type : list, tuple, set, forzenset, dict

# # # l1=[]
# # # # print(l1)
# # # l2=[1,"gaurav",True,4.02,10+20j] #heterogenous collection of elements
# # # l1.append("lwplabs")
# # # print(l2[1]) # list supports indexing ordered way
# # # l2[1]="Rahul" # list elemnents can be updated/changed: mutability
# # # print(l2)
# # # print(type(l1))

# # # all primitive data types in python is immutable in nature int, float, str, complex, bool

# # # a=10
# # # print(id(a))
# # # b=10
# # # a=20
# # # print(id(a))
# # # l1=[10,20,30]
# # # print(id(l1))
# # # l1[1]="gaurav"
# # # print(id(l1))
# # # # l2=[10,20,30] 
# # # # print(id(a))
# # # # print(id(b))
# # # # print(id(l1))
# # # # print(id(l2))


# # # list is ordered colleection of heterogenous elements and it is mutable in nature

# # # print(dir(list))
# # # students=["Ravish","Warries","Devender"]
# # # # print(students)
# # # # students.append("Vinayak")
# # # # print(students)
# # # # students.append("Nikhil")
# # # # print(students)

# # # students.insert(1,"Nikhil")
# # # #students.clear()

# # # print(students)

# # # students.remove("Warries")

# # # print(students)
# # # students.pop()
# # # print(students)
# # # students.pop()
# # # print(students)

# # # tuple immutable list

# # # l1=(10,"gaurav",30)
# # # l2=(10,"gaurav",30)
# # # print(id(l1))
# # # print(id(l2))
# # # print(l1[2])
# # # l1[2]="Rahul"
# # # print(l1)

# # # l1=[10,20,30]
# # # print(dir(l1))
# # # l1.reverse()
# # # print(l1)

# # #set data type

# # s={1,"gaurav",True} # mutable collection of heterogenous element does not support ordering

# # # print(s[1]) # does not support indexing

# # l=[1,"gaurav", True, 10.5, "gaurav"]
# # s={1,"gaurav", False, 10.5, "gaurav"} #duplicacy of element is not supported

# # print(l)
# # print(s)

# # # print(dir(s))

# # # method and function

# # # def add(a,b):
# # #     print (a+b)
# # #add(1,2)

# # # class math:
# # #     def add(a,b):
# # #         print(a+b)

# # # m1=math()
# # # m1.add(1,2)

# # #dict: {key:value}

# # # d={"A":"B"}
# # # s={1,2,3}
# # # d1={}
# # # s1=set()
# # # l=[]
# # # t=()
# # # d={}

# # # print(type(d))
# # # print(type(s))
# # # print(type(d1))
# # # print(type(s1))

# # #dict datatype

# # # students = {"Name":"Gaurav","Batch":10,"School": "DAV", "Roll_No": 102} # hashed data type can only be key of a dictionary

# # # immutable data types arw hashable

# # # tuple, int, float, str, bool, complex => key of a dictionary
# # # values: list, set, tuple, int, float, str, bool, complex

# # # dict mutable data type

# # # a=["gaurav"]
# # # print(hash(a))

# # students1={"Names":["Gaurav","Ravish","Nikhil"],"Batch":10,"School": "DAV", "Roll_No": 102}
# # d2={"x":"y"}
# # # print(id(students1))
# # # students1["Names"]=["Gaurav","Devender","Nikhil"]
# # # print(students1)
# # # print(id(students1))
# # # students1["Batch"]=20
# # # print(students1)

# # # students1.clear()
# # # print(students1)
# # print(dir(dict))
# # # students2=students1.copy()
# # students1.popitem()
# # print(students1)
# # slicing, indexing, loops, operatrs, conditional statements, function, generators, exception handelling, package mgmt, OOPS => lambda

# # l=[1,2,3,4]
# # s="gaurav"
# # t=(1,2,3,4)

# # print(l[1])
# # print(s[3])
# # print(t[3])

# # print(l[-3])

# # print(l[4])

# # slicing 

# # l=[1,"gaurav","abc",True,10.5]

# # print(l[1:4:2]) # [begin index: end index: step]
# # print(l[:4:3])

# # print(l[-4:-1])

# # print(l[-5:-2:2])

# # loops => iterable element #collection of data string, list,, set , tuple, dict range

# # loops type:

# # 1. for loop
# # 2. while loop
# # 1, 3, 5, 7, 9
# # for each in range(1,10,2):
# #     print(each)
# # i=0
# # while i<10:
# #     print(i)  #0,1,....,9
# #     i=i+1

# # airthmetic operator => +, -, *, /, //
# # logical operator => OR, AND
# # bitwise operator

# # a,b=10,5

# # print(a/b)
# # print(a//b)

# # ceil, floor

# # a=True
# # b=False

# # print(a or b) #True

# # print(a and b) # False

# # print(not a) # False

# #membership operator

# # in, not in

# # l=["gaurav","ravish","devender","nikhil"]

# # print("vinayak" not in l)

# #indentity operator

# # #is

# # a=10
# # b=10

# # l1=[10,20,30]
# # l2=[10,20,30]

# # print(l1 is l2) # address comparison

# # print(l1==l2) # values comparison

# # bitwise operator & , |
# # a=10 # 1010
# #         &
# # b=10 # 1010

# # a=10
# # b=10
# # print(a+b)

# # --


# # --

# # --


# # --
# # function add

# # if, else, elif

# # a=eval(input("enter a number: "))

# # if a%2==0:
# #     print(f"given number {a} is a even number")
# # else:
# #     print(f"given numaber {a} is a odd number")

# # switch cases

# # pl=input("your faviourate prgoramming language: ")

# # if pl == "java":
# #     print("Java is very good for oops and its very much used in enterprise applications")
# # elif pl == "nodejs":
# #     print("Nodejs is great for backends")
# # elif pl == "golang":
# #     print("best for infrastructure automation, multiple tools like k8s, terraform, docker etc are written in this lang")
# # elif pl == "python":
# #     print("evergreen language which you can use anywhere from data sc, web development, autoamtion, etc")
# # else:
# #     print("good to have this but its not very much famous now")

# # argument vs paramater

# # def add(a,b=2) -> int:
# #     return a+b

# # #positional arguments

# # print(add(10,20))

# # # keyword based arguments

# # print(add(b=20,a=10))

# # # default value argument
# # print(add(a=23))

# #variable length argument

# # method overloading : python does not support method overloading
# # operator overloading
# # def add(*args):
# #     a=0
# #     for x in args:
# #         a=a+x
# #     return a


# # print(add(10,20))
# # print(add(10,20,30))
# # print(add(10,20,30,40))


# # def add(**kwargs) -> int:
# #     a=0
# #     for x in kwargs.values():
# #         a=a+x
# #     yield a


# # c=add(a=10,b=20)
# # print(add(a=10,b=20,c=30))

# # kwargs={"a":10,"b":20}
# # print(kwargs.values())

# # for x in c:
# #     print(x)

# # exception handeling

# # def div(a,b):
# #     return a/b

# # print(div(10,"abc"))

# # try, except, finally 

# # try, catch, finally

# # def div(a,b):
# #     return a/b
# # try:
# #    print(div(10,"abc"))
# # except ZeroDivisionError as err:
# #     print(f"We cannot divide any number by zero please input some other denominator: {err}")
# #     b=eval(input("enter non-zero di=enominator: "))
# #     print(div(10,b))
# # except TypeError as e:
# #     print(f"for division num and den both should be a number {e}")
# # except Exception as err:
# #     print(err)

# # finally:
# #     print("code execution successfully")

# # module

# # import os
# # import boto3
# # import paramiko
# # from os import getenv
# # import paramiko as pm

# # import os

# # print(dir(os))

# #OOPS concept Object oriented programming

# # class, object, constructor, polymorphism, inheritance, abstract, interface, 
# # method

# class student():
#     def __init__(self,name, roll_no, age):
#         self.Name=name
#         self.roll=roll_no
#         self.Age=age
#     def add(self, a,b):
#         return a+b
#     @classmethod
#     def div(cls, x,y):
#         return x/y
#     @staticmethod
#     def sub(y,z):
#         return y-z

# s1=student("Gaurav",1,26)
# s2=student("Ravish",2,24)

# print(s1.add(10,20))

# print(student.div(10,2))
# print(s1.div(10,4))

# print(student.sub(4,3))
# print(s1.sub(90,87))