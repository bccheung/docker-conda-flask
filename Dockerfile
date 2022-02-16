# Use the Minimal Ubuntu-based miniforge Docker image
FROM condaforge/miniforge3

EXPOSE 5000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install Python packages using conda (miniforge)
COPY environment.yml ./
RUN conda env create -f environment.yml
RUN conda clean --all --yes

# Update environment variables to use created conda environment
ENV CONDA_DEFAULT_ENV flask-env
ENV PATH /opt/conda/envs/flask-env/bin:$PATH

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:app"]
