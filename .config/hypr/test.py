# Binary Calculator

# Binary to decimal

def binToDec():
    num = str(input("Enter the number in binary: "))
    num1 = num[::-1]
    final = 0
    for i in range(len(num1) -1, -1, -1):
        final = final + int(num1[i])*(2**i)
    print(f"Your decimal number is: {final}")

# binToDec()

# Decimal to binary

def decToBin():
    num = input("Enter the number in decimal(no floating values): ")
    remainder = []

    while num >= 2:
        num = num//2
        remainder.append(num%2)
    print(remainder)

decToBin()



