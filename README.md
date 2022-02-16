# docker-conda-flask

With the current working directory set to the parent folder of the Dockerfile,

1. Run `docker build -t docker-conda-flask .` to build a Docker image of the Flask app using the Dockerfile contained within the current director.
2. Run `docker run -dp 5000:5000 docker-conda-flask` to run the Docker image. Once launched, the dashboard is accessible at `http://127.0.0.1:5000`
