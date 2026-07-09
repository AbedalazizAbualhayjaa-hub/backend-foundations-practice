numbers = list(range(1, 31))


def is_prime(n):
    if n < 2:
        return False

    for i in range(2, n):
        if n % i == 0:
            return False

    return True


even_squares = [n * n for n in numbers if n % 2 == 0]

prime_check = {n: is_prime(n) for n in numbers}

divisible_by_2_and_3 = {n for n in numbers if n % 2 == 0 and n % 3 == 0}


print("Squares of even numbers:")
print(even_squares)

print("Prime check:")
print(prime_check)

print("Numbers divisible by both 2 and 3:")
print(divisible_by_2_and_3)
