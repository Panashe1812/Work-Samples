def strict(nums):

    for i in range(1, len(nums)):
        if i < len(nums):
            if nums[i - 1] < nums[i] and nums[i + 1] > nums[i]:
                count += 1
    return count

if  __name__ == "__main__":
    nums = [11,7,2,15]
    strict(nums)