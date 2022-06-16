
def sort4(x,y,z,u):
    # sort the first two pairs
    if x>y:
            x,y = y,x
    if z>u:
            z,u = u,z
     #after this, u is the largest
    if y>u:
           y,u = u,y
    #after this step x is becomes the smallest
    if x>z:
        x,z =z,x
    # and the last pair in the middle

    if y>z:
        y,z =z,y

    return x,y,z,u
