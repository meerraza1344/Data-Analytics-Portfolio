while True:
    num1 = float(input("Enter first number: "))
    op = input("Enter operator (+, -, *, /) or 'q' to quit: ")

    if op.lower() == 'q':
        print("Calculator closed. Allah Hafiz!")
        break

    num2 = float(input("Enter second number: "))

    if op == "+":
        print("Result:", num1 + num2)
    elif op == "-":
        print("Result:", num1 - num2)
    elif op == "*":
        print("Result:", num1 * num2)
    elif op == "/":
        print("Result:", num1 / num2)
    else:
        print("Invalid Operator!")

    print("-" * 20)          