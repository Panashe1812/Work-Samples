def jump_game(nums):
    for i in range(0, (len(nums) - 1)):

        if nums[i + nums[i]] == nums[-1]:
            return True
    return False


if __name__ == "__main__":
