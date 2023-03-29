# action-cargo-source
Source repo for action-cargo

## Usage


### Build container locally 
```
docker build . -t action-cargo:latest -f ./Dockerfile
```

### run container locally
```
docker run -v$PWD/examples/hello:/github/workspace -t action-cargo:latest . cargo contract test
docker run -v$PWD/examples/hello:/github/workspace -t action-cargo:latest . cargo test
docker run -v$PWD/examples/hello:/github/workspace -t action-cargo:latest . cargo contract build
```