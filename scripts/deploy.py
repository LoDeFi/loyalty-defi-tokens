from brownie import accounts, config, network, LdfToken
from web3 import Web3

initial_supply = Web3.toWei(1000, "ether")



def deploy_simple_storage():
    account = accounts.add(config["wallets"]["from_key"])
    simple_storage = LdfToken.deploy(initial_supply, {"from": account})
    print(simple_storage)


def main():
    deploy_simple_storage()
