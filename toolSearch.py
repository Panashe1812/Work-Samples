if __name__ == "__main__":
    Tools = ['saw', 'hammer', 'mallet',
             'file', 'saw', 'ladder', 'scissor']
    Starting_Index: 6

    Target: 'saw'
    tools(Tools, start, Target)

def tools(Tools, start, target):
    n = len(Tools)
    i = start
    steps = 0

    while i < n + start:
        steps += 1
        if target == Tools[i % n]:
            return steps
        i = i + 1
