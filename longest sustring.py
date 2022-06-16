def longestSub(s):
    # # declare a set
    # charSet = set()
    #
    # left = 0
    # result = 0
    #
    # for right in range(len(s)):
    #     while s[left] in charSet:
    #         charSet.remove(s[left])
    #         left += 1
    #     charSet.add(s[right])
    #     result = max(result, right - left + 1)
    # return result

    if len(s) == 0:
        return 0

    seenCharacters = {}

    left = 0
    right = 1

    maxLen = 1
    seenCharacters[s[left]] = left

    # For left, you do not need to go to the end. If right hits end, you
    # have already found the max length, checking from left to the end
    # is unnecessary even though there could be SMALLER valid substrings
    while right < len(s):

        newChar = s[right]

        # Checking if character is in the map and has to be greater than
        # left pointer. This is to allow the left pointer to jump/update without
        # having to delete/remove items from the hashmap
        if newChar in seenCharacters and seenCharacters[newChar] >= left:
            left = seenCharacters[newChar] + 1
        else:
            # Only get max when no duplicates
            maxLen = max(right - left + 1, maxLen)

        # Continuously update the mapping, even if seen before since the new
        # location of the existing character is important for the if
        # condition above
        seenCharacters[newChar] = right
        right = right + 1

    return maxLen


if __name__ == "__main__":
    s = "abcabcbb"
    print(longestSub(s))
