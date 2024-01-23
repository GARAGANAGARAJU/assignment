FROM ubuntu:latest

# Set noninteractive environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Set the PATH variable
ENV PATH="/usr/games:$PATH"
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh
EXPOSE 4499

# Command to run when the container starts
CMD ["/app/wisecow.sh"]
