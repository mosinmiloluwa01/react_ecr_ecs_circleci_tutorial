# pull official base image
FROM node:14 AS build

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . .

COPY --from=build /app /app

WORKDIR /app

# start app
CMD ["npm", "start"]