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

Se você abrir o requirements.txt, deverá ver listadas todas as bibliotecas necessárias do projeto.

    certifi==2020.6.20
    chardet==3.0.4
    click==7.1.2
    Flask==1.1.2
    idna==2.10
    itsdangerous==1.1.0
    Jinja2==2.11.2
    jsonify==0.5
    MarkupSafe==1.1.1
    numpy==1.19.2
    pandas==1.1.3
    Pillow==8.0.1
    python-dateutil==2.8.1
    pytz==2020.1
    requests==2.24.0
    six==1.15.0
    urllib3==1.25.11
    webcolors==1.4
    Werkzeug==1.0.1

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
        - "5000:9007"
        volumes:
        - .:/usr/api

Executar docker-compose:

    docker-compose up
