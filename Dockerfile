FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
COPY node_modules ./
COPY . .
RUN npm run build

FROM node:20-alpine
RUN npm install -g serve
COPY --from=builder /app/dist ./dist
EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]
