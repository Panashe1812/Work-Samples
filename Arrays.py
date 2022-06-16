# tools_array = ['saw', 'hammer', 'mallet',
#                'file', 'saw', 'ladder', 'scissor']


def tools_finder(tools_array, start_index, target_tool):
    # tools_array = ["saw", "hammer", "mallet", "shovel"]
    # start_index = 2
    # target_tool = "mallet"

    if start_index == tools_array.index("mallet"):
        number_of_steps = 0
        print("FAILED")
        print(number_of_steps)
    else:
        for index in range(start_index, len(tools_array)):
            number_of_steps = number_of_steps + 1
            current_index = start_index + 1

            if start_index == tools_array.index("mallet"):
                print("Done")
                print(number_of_steps)


if __name__ == "__main__":
    tools_array = ['saw', 'hammer', 'mallet', 'file', 'saw', 'ladder', 'scissor']
    start_index = 2
    target_tool = "mallet"

    tools_finder(tools_array, start_index, target_tool)