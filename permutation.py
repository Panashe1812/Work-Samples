def insertion(e, s):
    for i in range(len(s) + 1):
        yield s[:i] + [e] + s[i:]


def perm(s):
    if s == []:
        yield []
    else:
        e, s1 = s[0], s[1:]
        for s1p in perm(s1):  # s1p is s1 partition [2,3,4]
            for p in insertion(e, s1p):
                yield p


for p in perm([1, 2, 3, 4]): print(p)
