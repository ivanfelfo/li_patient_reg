# Use the official Ruby image as the base image
FROM ruby:3.0.0

# Set working directory in the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs \
                       sqlite3 \
                       libsqlite3-dev \
                       vim

# Install bundler and gem dependencies
RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 for Rails server
EXPOSE 3000

# Start the Rails server by default when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
