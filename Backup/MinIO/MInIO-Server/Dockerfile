# Use a imagem base do MinIO
FROM quay.io/minio/minio:latest

# Crie o diretório /data dentro do contêiner
RUN mkdir /data

# Defina o diretório /data como diretório de trabalho padrão
WORKDIR /data

# Copie o arquivo Dockerfile para o contêiner
COPY . /mnt/backup/

# Exponha as portas 9001
EXPOSE 9001

# Configure as variáveis de ambiente para o usuário root e a senha
ENV MINIO_ROOT_USER=admin
ENV MINIO_ROOT_PASSWORD=47523146phB@

# Comando de inicialização do MinIO Server
CMD ["server", "/data", "--console-address", ":9001"]
