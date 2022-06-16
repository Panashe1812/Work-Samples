# Python3 program to demonstrate the use of
# circular array without using extra memory space

# function to print circular list starting
# from given index ind.
def SearcTool(tools, length, start_index, target):
    i = start_index
    steps = 0

    while i < length + start_index:

        if target == (tools[(i % length)]):
            print(steps)
            return steps
        steps += 1

        i = i + 1


if __name__ =="__main__":
    Tools = ['saw', 'hammer', 'mallet',
             'file', 'saw', 'ladder', 'scissor']

    length = len(Tools);
    target = "hammer"
    start_index = 2

    SearcTool(Tools, length, start_index, target)