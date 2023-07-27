FROM ruby:3.1.0
# This is the command to run in the container. build-essential and Node.js are installed. (Required for Rails to work)
RUN apt-get update -qq && apt-get install -y build-essential nodejs
# Create a directory named "/app" (the directory where Rails is built) in the container as a working directory.
RUN mkdir /app
WORKDIR /app
# Copy Gemfile and Gemfile.lock to "/app" and install.
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Copy the directory where the Dockerfile is located to "/app",
#  which is listed to include all the files necessary to run the Rails application in the container.
# So, do not place any extra files in the directory where the Dockerfile is located.
COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0"]