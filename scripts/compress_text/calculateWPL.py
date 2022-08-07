import sys

with open(sys.argv[1], 'r') as f:
    WPL = 0
    while True:
        l = f.readline()
        if not l:
            break
        l = l[:-1]
        if 'leaf' in l:
            WPL += int(l.split('freq = ')[1]) * (1 + l.index('(') / 2)

print(WPL)
