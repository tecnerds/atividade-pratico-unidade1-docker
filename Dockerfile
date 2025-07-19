# Preparando a imagem Docker
FROM python:3.11-slim

# Definindo diretório de trabalho
WORKDIR /app

# Copiando todos os arquivos da raiz do projeto para o diretório de trabalho
COPY . .

# Instalando as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]