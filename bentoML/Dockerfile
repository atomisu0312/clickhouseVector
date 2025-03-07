FROM python:3.13-slim

# 作業ディレクトリを設定
WORKDIR /app

# requirements.txt をコンテナにコピー
COPY requirements.txt .

RUN pip install -r requirements.txt

# Command to run your BentoML service
CMD ["bentoml", "serve", "service:Summarization"]