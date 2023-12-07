docker build -t todo-backend-image .
docker run --rm -it --name todo-container-backend -p 8000:3000 -v /Users/nhattuandao/bclearn/part12-containers-applications/todo-app/todo-backend:/usr/src/app todo-backend-image

