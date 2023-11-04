# author: martinthong125@gmail.com
# purpose: simple python script with 2 parameters
# run: python3 hello2.py name=martin age=25


import argparse

def hello(name, age):
    print(f"Hello {name}, you are {age} years old.")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("name", help="The name to greet")
    parser.add_argument("age", help="The age of the person to greet")
    args = parser.parse_args()
    hello(args.name, args.age)

if __name__ == "__main__":
    main()
