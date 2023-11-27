docker kill todo-container-backend
docker container rm todo-container-backend
docker image rm -f todo-backend-image
docker build -t todo-backend-image .
docker run -i --name todo-container-backend -p 8000:3000 todo-backend-image

