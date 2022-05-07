"""
hofstadler
https://en.wikipedia.org/wiki/Hofstadter_sequence#Hofstadter_Female_and_Male_sequences
"""
def f(n):
    if n == 0:
        return 1
    return n - m(f(n-1))

def m(n):
    if n == 0:
        return 0
    return n - f(m(n-1))


print(f(25))
print(m(25))

