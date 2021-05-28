# python-container

# Instação de requerimentos do projeto

    pip freeze > requirements.txt

# TUTORIAL: Docker + Flask | Dockerizing A Python API

No arquivo main:

    from flask import Flask, jsonify, request

    app=Flask(__name__)

    @app.route("/",methods=['GET'])
    def index():
        if request.method=='GET':
            return jsonify("Ola Mundo!")

    if __name__ == '__main__':
        app.run(debug=True,host='0.0.0.0', port=5000)

Criar arquivo requirements:

    pip freeze > requirements.txt

Dockerfile

    FROM python:3.9

    WORKDIR /usr/api

    COPY requirements.txt ./
    RUN pip install --no-cache-dir -r requirements.txt

    COPY . .

    CMD ["python", "./src/main.py"]

Buildar Container:

        docker build -t your_docker_image_name -f Dockerfile .

Criar docker-compose.yml:

    version: "3"

    services:
    python-container:
        build: .
        ports:
        - "80:80"
        volumes:
        - .:/usr/api

Executar docker-compose:

    docker-compose up
