## Part 1. Ready-made Docker

1. Downloading the official docker image from nginx using `docker pull`

    ![part1](./screenshots/part1_1.png)

2. Check for the docker image with `docker images`

   ![part1](./screenshots/part1_2.png)

3. Run docker image

   ![part1](./screenshots/part1_3.png)

4. Check that the image is running

   ![part1](./screenshots/part1_4.png)

5. View container information

   ![part1](./screenshots/part1_5.png)

   ![part1](./screenshots/part1_6.png) 

   ![part1](./screenshots/part1_7.png)

   ![part1](./screenshots/part1_8.png)

   ![part1](./screenshots/part1_9.png)

   ![part1](./screenshots/part1_10.png)

   ![part1](./screenshots/part1_11.png)

   ![part1](./screenshots/part1_12.png)

   ![part1](./screenshots/part1_13.png)

6. From the command output

   1) the container size
   
      ![part1](./screenshots/part1_14.png)

   2) list of mapped ports

      ![part1](./screenshots/part1_15.png)

   3) container ip 

      ![part1](./screenshots/part1_16.png)

7. Stop docker image

   ![part1](./screenshots/part1_17.png)

8. Check that the image has stopped

   ![part1](./screenshots/part1_18.png)

9. Run docker with mapped ports 80 and 443 on the local machine

   ![part1](./screenshots/part1_19.png)

10. Check that the nginx start page is available in the browser at `localhost:80`

   ![part1](./screenshots/part1_20.png)

11. Check that the container is running

   ![part1](./screenshots/part1_21.png)

## Part 2. Operations with container

1. Read the nginx.conf configuration file inside the docker container

   ![part2](./screenshots/part2_1.png)

   ![part2](./screenshots/part2_2.png)

2. Create a nginx.conf file on a local machine

   ![part2](./screenshots/part2_3.png)

3. Configure nginx.cong file on the /status path to return the nginx server status page

   ![part2](./screenshots/part2_4.png)

4. Copy the created nginx.cong file inside the docker image

   ![part2](./screenshots/part2_5.png)

5. Restart nginx inside the docker image

   ![part2](./screenshots/part2_6.png)

6. Check that localhost:80/status

   ![part2](./screenshots/part2_7.png)

7. Export the container to a `container.tar`

   ![part2](./screenshots/part2_8.png)

8. Stop the container

   ![part2](./screenshots/part2_9.png)

9. Delete the image without removing the container first

   ![part2](./screenshots/part2_10.png)

10. Delete stopped container

   ![part2](./screenshots/part2_11.png)

11. Import the container back

   ![part2](./screenshots/part2_12.png)

12. Import the container back

   ![part2](./screenshots/part2_13.png)

13. Run the imported container

   ![part2](./screenshots/part2_14.png)

14. Check the localhost:80/status

   ![part2](./screenshots/part2_15.png)

## Part 3. Mini web server

1. Mini server in C and FastCgi

   ![part3](./screenshots/part3_1.png)

2. Downloading the official docker image from nginx

   `docker pull nginx` 

3. Running docker image

   `docker run -d -p 81:81 nginx`

4. Check that the image is running

   `docker ps`

5. Copy the created nginx.conf file inside the docker image

   `docker cp ./nginx.conf NAME:/etc/nginx/`

6. Copy the created mini server in C inside the docker image

   `docker cp ./hello.c NAME:/home/`

7. Execute an interactive bash shell on the container

   `docker exec -it NAME bash`

8. Installing updates

   `apt update`

9. Installing the spawn-fcgi utility which allows to spawn remote and local FastCGI processes

   `apt install spawn-fcgi`

10. Installing FastCGI packages

   `apt install libfcgi-dev`

11. Installing the gcc compiler

   `apt install gcc`

12. Move to the home directory

   `cd ./home/`

13. Compile the program

   `gcc hello.c -o hello -lfcgi`

14. Spawn FastCGI process

   `spawn-fcgi -p 8080 ./hello`

15. Reload nginx

   `nginx -s reload`

16. Check the page with the web server

   `curl localhost:81`

## Part4. Your own docker

1. Create the Dockerfile

   `touch Dockerfile`

2. Build an image from the Dockerfile

   `docker build -t test:new .`

3. Check the image was created correctly

   `docker images`

4. Run the image

   `docker run -d -p 80:81 -v "$(pwd)"/nginx/:/etc/nginx/ test:new`

5. Check the page with the mini server

   `curl localhost:80`

6. Restart docker container, after editing nginx.conf

   `docker container restart <NAME>`

7. Check that the page with nginx status

   `curl localhost:80/status`

## Part 5. Dockle

1. Install dockle

   `brew install goodwithtech/r/dockle`

2. Check the image from the previous task

   `dockle --accept-key NGINX_GPGKEY test:new`

3. Fix the image

## Part 6. Basic Docker Compose

1. Write and build docker-compose.yml file

   `docker compose build`

2. Run the project

   `docker compose up -d`

3. Check that everything fine

   `curl localhost:80`