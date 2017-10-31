import os
import os.path
import sys
import pyratemp
from datetime import datetime

class TestClass:
    name = ""
    value = ""

def Main(_argv):
    testClasses = []
    testClass1 = TestClass()
    testClass1.name = "Name 1"
    testClass1.value = "This is the first value"
    testClasses.append(testClass1)
    testClass2 = TestClass()
    testClass2.name = "Name 2"
    testClass2.value = "This is the second value"
    testClasses.append(testClass2)
    
    args = {}
    args["testClasses"] = testClasses
    t = pyratemp.Template(filename="test.tmpl")
    with open("TestClassTemplate.txt", "w") as fout:
        templateOut = t(**args)
        fout.write(templateOut)
        
if __name__ == "__main__":
  Main(sys.argv)

