## Setup

Install Hasura CLI and Yarn:

```
# Install Yarn
brew install yarn
# Install Hasura
curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
```

### Installation

To install the required dependencies for the SyncNode, run:

```bash
yarn install
```

### Usage

First you need to launch the required services:

```
docker-compose up postgres redis -d
```

then launch the SyncNode with the below:

```
yarn start
```

finally once it is fully started, run hasura:

```
docker-compose up hasura -d
```

Hasura is now running and available at [http://localhost:8080](http://localhost:8080)

Then apply Hasura metadata

```
cd hasura-reservoir
hasura metadata apply
```

### Configuration - ENV

Learn more about configuration for the Reservoir node: [docs](https://docs.reservoir.tools/reference/reservoir-sync-node).
