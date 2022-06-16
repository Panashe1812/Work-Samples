import hero

class Hero_token(hero.Hero):
    def token(self, state):
        #get the list of person and locations and sort them to be unique
        pairs = sorted(state[0].items())
        return tuple(pairs), state[1]   # people and the boat
