# Builder Stage
FROM node:alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Runner Stage for Production
FROM nginx:alpine AS runner
COPY --from=builder /app/build /usr/share/nginx/html
