while True:
    marks= int(input("Enter your marks"))

    if marks >= 85:
        print("Grade: A+")
        print("Excellent")
    elif marks >= 80: 
        print("Grade: A")
        print("Very Good")
    elif marks >= 60:
        print("Grade: B")
        print("Good")
    elif marks >= 40:
        print("Grade: C")
        print("Need improvement")
    else:
        print("Grade: Fail") 
        print("Shame on you")

print("-" * 20)
    