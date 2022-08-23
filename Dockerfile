FROM node:14-alpine

ENV PORT 1337
ENV HOST 0.0.0.0
ENV NODE_ENV production
ENV JWT_SECRET "7267290f3af92866e62a636936e9f2a455994de4d5af29a7b2e681eaf4fe18b48377ff17877b0760f39585d0d7b1b39de1548a7ab84f32edd8553eb27e6a44ac"
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN yarn install

# Bundle app source
COPY . /usr/src/app

RUN yarn build
EXPOSE 1337

CMD [ "yarn", "start" ]