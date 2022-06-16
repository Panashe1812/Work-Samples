class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

    def __repr__(self):
        return self.data


class LinkedList:
    def __init__(self):
        self.head = None

    def __repr__(self):
        node = self.head
        nodes = []
        while node is not None:
            nodes.append(node.data)
            node = node.next
        nodes.append("None")
        return " -> ".join(nodes)


if __name__ == "__main__":
    # create the linked list
    my_list = LinkedList()
    first_node = Node("a")
    my_list.head = first_node

    # create the nodes

second_node = Node("b")
third_node = Node("c")

# links the list
first_node.next = second_node
second_node.next = third_node

print(my_list)
