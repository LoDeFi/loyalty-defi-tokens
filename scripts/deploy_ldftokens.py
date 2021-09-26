from brownie import accounts, config, network, LdfToken
from web3 import Web3

initial_supply = Web3.toWei(1000, "ether")

def deploy_ldftokens():
    account = accounts.add(config["wallets"]["from_key"])
    ldftokens = LdfToken.deploy(initial_supply, {"from": account})
    print(ldftokens)


def main():
    deploy_ldftokens()
