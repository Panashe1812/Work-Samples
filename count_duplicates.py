class Solution(object):
    def containsDuplicate(self, nums):

        from collections import Counter

        my_counter = Counter(nums)
        print(my_counter.values())
        for i in my_counter.values():
            if i >= 2:
                return True

        return False


if __name__ == "__main__":
    nums = [2, 14, 18, 22, 22]
    my_sol = Solution()
    my_sol.containsDuplicate(nums)
