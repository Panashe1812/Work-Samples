def coinChange(amount, coins):
    dp = [amount +1]* (amount+1)
    dp[0] = 0

    for amt in range(1, amount + 1):
        for coin in coins:
            if amt -coin >=0:
                dp[amt]= min(dp[amt],1+dp[amt-coin])
    return dp[amount] if dp[amount]!= amount +1 else -1


if __name__ == "__main__":

    coins = [1, 2, 5]
    amount = 11
    print(coinChange(amount, coins))