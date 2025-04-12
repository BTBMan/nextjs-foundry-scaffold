-include .env

# Constants #########################################################
SIMPLE_STORAGE_SCRIPT := contract/script/SimpleStorage.s.sol:SimpleStorageScript
NFT_SCRIPT := contract/script/NFT.s.sol:NFTScript

NETWORK_ARGS :=

# Defines ###########################################################

# Conditions #######################################################
# E.g: make xxx network=local
ifeq ($(findstring local,$(network)),local)
	NETWORK_ARGS := --rpc-url $(LOCAL_RPC_URL) --private-key $(LOCAL_PRIVATE_KEY) --broadcast -vvvv
endif

# E.g: make xxx network=sepolia
ifeq ($(findstring sepolia,$(network)),sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(TEST_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
endif

# E.g: make xxx network=monad
ifeq ($(findstring monad,$(network)),monad)
	NETWORK_ARGS := --rpc-url $(MONAD_RPC_URL) --private-key $(TEST_PRIVATE_KEY) --broadcast --verify --verifier sourcify --verifier-url $(MONAD_VERIFY_URL) -vvvv
endif

# Aliases ###########################################################
build:; forge build

deploy-simple-storage:; @forge script $(SIMPLE_STORAGE_SCRIPT) $(NETWORK_ARGS) && esno scripts/generate-abi.ts $(SIMPLE_STORAGE_SCRIPT)

deploy-nft:; @forge script $(NFT_SCRIPT) $(NETWORK_ARGS) && esno scripts/generate-abi.ts $(NFT_SCRIPT)

test:; @forge test