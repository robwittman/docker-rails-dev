## Rails / Docker environment

This repo contains a skeleton Rails application (4.1.16)

### Getting Started

To use the environment, simply pull down this repo, fill out some files, and run docker-compose

```shell
# Pull down the repo
git clone https://github.com/robwittman/docker-rails-dev
#Copy our .env file
cp /path/to/my.env .env

# Start the environment
docker-compose up
```

Head to http://localhost:3000 (by default) and 'Welcome aboard'

### Services

There are a few services bundled with the environment. You can add them by uncommenting their
respective section in docker-compose.yml, or even adding custom ones
