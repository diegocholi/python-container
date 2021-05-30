FROM python:3.9

WORKDIR /usr/api

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "-u", "./src/main.py"]
