# menggunakan base image Node.js versi 18 alpine
FROM node:18-alpine as base
# menentukan bahwa working directory untuk container adalah /src
WORKDIR /src
# menyalin file package.json dan package-lock.json ke working directory
COPY package*.json ./

# mendefinisikan dev stage 
FROM base as dev
# menginstall bash
RUN apk add --no-cache bash
# mendownload file wait-for-it.sh
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
# memberikan akses execute untuk file wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# mengisi environment NODE_ENV dengan development 
ENV NODE_ENV=development
# menginstal semua dependencies
RUN npm install
# menyalin file index.js ke working directory
COPY ./index.js ./
# menyalin file .env ke working directory
COPY ./.env ./
# menjalankan node service
CMD ["node", "index.js"]
