text = """
1000100100000000
1000100111111111
0100100100000001
1001100000000001
"""

lines = text.strip().splitlines()

for line in lines:
    binary = line.strip()
    value = int(binary, 2)
    print(f"{value:04X}")