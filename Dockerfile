FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy source files
COPY . .

# Build the Remix app
RUN yarn build

# Expose port
EXPOSE 3000

# Start the server
ENV NODE_ENV=production
CMD ["yarn", "start"]
