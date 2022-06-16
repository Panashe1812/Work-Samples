candidates = ({('kick', 1): 'left', ('kick', 3): 'left', ('kick', 2): 'left',
               ('hero', 3): 'left', ('hero', 2): 'left', ('hero', 1): 'left'}, 'left')

# running this function returns the dictionary first without then with the boat.
def select_travellers(candidates):
    for first in range(len(candidates)):
        yield [candidates[first]]

    for first in range(len(candidates)):
        for second in range(first + 1, len(candidates)):
            yield [candidates[first], candidates[second]]

other_side = {'left': 'right', 'right': 'left'}

# state

##state = candidates
##person_side, _ = state  #unpacks the tuple candidates and creates a dictionary
##                        #person_side and _ for the boat.

def safe(state):
    person_side, _ = state

    for side in ['left', 'right']:
        lone_kick = [index for (person, index) in person_side
                     if person == 'kick'
                     if person_side[person, index] == side
                     # i don't get how the dictionary is being accessed in two different ways
                     if person_side['hero', index] != side]
        # check all sidekicks on the given sides without their hero
        present_hero = [index for (person, index) in person_side
                        if person == 'hero'
                        if person_side[person, index] == side]
    if lone_kick and present_hero:
        return False
    return True

class Hero:

    def start(self):
        return {(person, index): 'left'
                for person in ['hero', 'kick']
                for index in [1, 2, 3]}, 'left'

    def goal(self,state):
        # where everybody and the boat is
        person_side, boat = state
        return set(person_side[person] for person in person_side) == {"right"}
        # person_side.values should also work , tried this it didn't work

    def succ(self, state):
        # who can move
        person_side, boat = state
        # collect all people on the side of the boat
        person_with_boat = [person for person in person_side if
                            person_side[person] == boat]

        for traveller_group in select_travellers(person_with_boat):
            new_side = person_side.copy()  # never change the original

            for traveller in traveller_group:
                new_side[traveller] = other_side[person_side[traveller]]

            new_state = new_side, other_side[boat]

            if safe(new_state):
                yield new_state