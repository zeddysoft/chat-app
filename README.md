# chat-app
A group chat CLI app using TCP Socket. 

# Running via Docker
The app is composed of both a client and a server (which listens on port 5300).

## 
Building and running the Server

1. Change to the server directory
```
cd server/
```
2. Build docker image
```
docker build -t zeddysoft/server .
```
3. Spin off a docker container

```
docker run -it -p 5300:5300 zeddysoft/server
```

## 
Building and running clients

1. Change to the client directory
```
cd client/
```
2. Build docker image
```
docker build -t zeddysoft/client .
```
3. Spin off as many client docker containers

```
docker run -it zeddysoft/client
```