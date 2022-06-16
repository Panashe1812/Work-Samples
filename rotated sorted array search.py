# nums = [5,6,7,1,2,3,4] target is 3

def search(nums, target):
    l, r = 0, len(nums) - 1

    while l < r:
        mid = (l + r) // 2
        if target == nums[mid]:
            return mid
        # left sorted portion
        # target less the middle but also less the left value in nums
        if nums[l] <= nums[mid]:
            if target > nums[mid]:
                l = mid + 1
            elif target < nums[l]:
                l = mid + 1
        else:
            if target < nums[mid]:
                r = mid - 1
            elif target > nums[r]:
                r = mid - 1
            else:
                l = mid + 1
    return -1


if __name__ == "__main__":
    nums = [4, 5, 6, 7, 0, 1, 2]
    target = 3
    search(nums, target)