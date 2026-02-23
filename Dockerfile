FROM node:20-alpine
RUN npm install -g serve
COPY public ./dist
EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]
