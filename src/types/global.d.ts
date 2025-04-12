import type { PropsWithChildren } from 'react'

declare global {
  type PageProps<P = unknown, S = unknown> = Readonly<{
    params: Promise<P>
    searchParams: Promise<S>
  }>

  type PagePropsWithChildren<P = unknown, S = unknown> = Readonly<PropsWithChildren<PageProps<P, S>>>

  namespace NodeJS {
    interface ProcessEnv {
      // WalletConnect
      NEXT_PUBLIC_WALLET_CONNECT_PROJECT_ID: string

      // Pinata
      PINATA_JWT: string
      NEXT_PUBLIC_GATEWAY_URL: string

      // Accounts
      LOCAL_PRIVATE_KEY: string
      TEST_PRIVATE_KEY: string

      // RPC URLs
      LOCAL_RPC_URL: string
      SEPOLIA_RPC_URL: string
      MONAD_RPC_URL: string

      // Etherscan
      ETHERSCAN_API_KEY: string

      // Verify URLs
      MONAD_VERIFY_URL: string
    }
  }

  interface NFTMetadata {
    name: string
    description: string
    image: string
    attributes?: Record<string, any>[]
  }
}

export {}
