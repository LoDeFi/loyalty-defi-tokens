
from brownie import accounts, config, LdfLevelToken
from web3 import Web3

sample_token_uri = "https://ipfs.io/ipfs/Qmd9MCGtdVz2miNumBHDbvj8bigSgTwnr4SbyH6DNnpWdt?filename=0-PUG.json"
OPEN_SEE_URL = "https://testnets.opensea.io/assets/{}/{}"

def main(): 
    account = accounts.add(config["wallets"]["from_key"])
    ldfLT = LdfLevelToken.deploy({"from": account})
    tx = ldfLT.createCollectable(sample_token_uri, {"from": account})
    tx.wait(1)
    # print(OPEN_SEE_URL.format(ldfLT.address, ldfLT.tokenCounter - 1))



# initial_supply = Web3.toWei(1000, "ether")
