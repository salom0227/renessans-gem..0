FROM node:20-alpine

WORKDIR /app

COPY index.html . 
COPY renessans_files ./files

RUN npm init -y && npm install express

# server.js faylini yaratamiz
RUN echo "const express = require('express'); \
const app = express(); \
app.use('/files', express.static(__dirname + '/files')); \
app.get('/', (req, res) => res.sendFile(__dirname + '/index.html')); \
app.listen(80, () => console.log('Server running on port 80'));" \
> server.js

EXPOSE 80

CMD ["node", "server.js"]
