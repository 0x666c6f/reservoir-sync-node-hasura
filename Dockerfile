# Stage 1: Build environment
FROM node:18 AS build

WORKDIR /app

# Copy package.json and yarn.lock for dependency installation
COPY package.json yarn.lock contracts.txt ./

# Install all dependencies (including dev dependencies)
RUN yarn install

# Copy the rest of your application code to the container
COPY . .

# Build your TypeScript application
RUN yarn build

# Stage 2: Production environment
FROM node:18-alpine AS production

WORKDIR /app

# Copy package.json and yarn.lock from the build stage
COPY --from=build /app/package.json /app/yarn.lock ./
COPY --from=build /app/prisma ./prisma
COPY --from=build /app/start.sh ./start.sh

# Install only production dependencies
RUN yarn install --production

# Copy the built application from the build stage
COPY --from=build /app/dist ./dist
COPY --from=build /app/contracts.txt ./dist/contracts.txt

# Define the command to start your application
CMD ["./start.sh"]
