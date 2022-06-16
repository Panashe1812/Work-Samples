import random

def nim_basic(n):
    return 1

def nim_random(n):
    return random.choice([1, 2, 3])

def nim_best(n):
    best_case = n % 4
    if best_case == 0:
        return 1
    else:
        return best_case

def nim_human(n):
    human_pick = int(input("Pick, 1,2 or 3 sticks: "))
    while human_pick not in [1, 2, 3]:
        human_pick = int(input("Please Try again: "))
    return human_pick

def select_player_pair():
    # enter players in the players list
    player_list = []
    player_function_list = [nim_basic, nim_random, nim_best, nim_human]

    while len(player_list) != 2:
        function_name = input("Enter a player function name: ")

        for player_function in player_function_list:
            if function_name == player_function.__name__:
                player_list.append(player_function)

    return player_list

def game_controller():
    n = int(input("Enter heap size: "))

    while n <= 0:
        int(input("Please enter a number > 0: "))

    players = select_player_pair()

    while n > 0:
        p1 = players[0]  # don't repeat yourself
        # players[0](5) p1 is a function
        n = n - p1(n)
        players.reverse()

def main():
    game_controller()

if __name__ == '__main__':
    main()