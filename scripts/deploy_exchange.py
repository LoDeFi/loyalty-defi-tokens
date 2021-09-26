from brownie import LdfExchange, accounts, config
from web3 import Web3

def main():
    account = accounts.add(config["wallets"]["from_key"])
    return LdfExchange.deploy({'from': account})
