FROM node:20

# Install git
RUN apt-get update && apt-get install -y git dos2unix

WORKDIR /home/app

COPY main.sh .
COPY script.js .
COPY package*.json ./

# Convert script to Unix format and make executable
RUN dos2unix main.sh && \
    chmod +x main.sh && \
    chmod +x script.js

RUN npm install

# Use shell form for ENTRYPOINT to ensure proper script execution
ENTRYPOINT ["/bin/bash", "/home/app/main.sh"]