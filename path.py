class Path:
    def __init__(self,path = [],length =0):
        # current path, current length
        self.path = path
        self.length = length

    def __le__(self,path2):
        # self <= path2
        #default comparison by cost
        return self.length <= path2.length

    def __len__(self): return self.length

    def cost(self, n_from,n_to): return 1

    def current(self):
        if not self.path:
            raise Exception("Path is empty ")
        return self.path[-1]

    def appended(self,node):
        return self.__class__(path =self.path + [node],
                              length =self.length +
                              self.cost(self.current(),node))

