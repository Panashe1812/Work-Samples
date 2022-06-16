def __init__(self, nodes=None):
    self.head = None
    if nodes is not None:
        node = Node(data=nodes.pop(0))
        self.head = node
        for elem in nodes:
            node.next = Node(data=elem)
            node = node.next

# Traversing is just a fancier way to say iterating. So, with that in mind,
# create an __iter__ to add the same behavior to linked lists that you would expect from a normal list:

def __iter__(self):
    node = self.head
    while node is not None:
        yield node
        node = node.next

def add_first(self, node):
    node.next = self.head
    self.head = node