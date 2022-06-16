class Solution:
    def twoSum(self, nums, target) :
        hashmap = {}
        for i in range(len(nums)):
            hashmap[nums[i]] = i
        for i in range(len(nums)):
            complement = target - nums[i]
            if complement in hashmap and hashmap[complement] != i:
                return [i, hashmap[complement]]

if __name__ =="__main__":
    sol = Solution()
    result = sol.twoSum([2,7,11,15], 9)
    print(result)