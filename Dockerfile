# Base image for Ruby
FROM ruby:3.1.2

# Set working directory
WORKDIR /app

# Install dependencies for Rails and PostgreSQL
RUN apt-get update -qq && apt-get install -y build-essential nodejs libpq-dev

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose port for the Rails server
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

