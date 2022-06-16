import hero

def breadth_first_searc(problem, candidates):
    if not candidates: return

    c= candidates.pop(0)
    node = c[-1]

    if problem.goal(node): return c

    for s in problem.succ(node):
        candidates.append(c + [s])

    return breadth_first_searc(problem, candidates)

