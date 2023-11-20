docker kill todo-container-backend
docker container rm todo-container-backend
docker image rm -f todo-backend-image
docker build -t todo-backend-image .
docker run --name todo-container-backend -p 4000:3000 todo-backend-image

