# Dockerfile

FROM ubuntu:latest

# Install cron and Python
RUN apt-get update && \
    apt-get install -y cron python3.11 python3-venv

# Create a directory to store the virtual environment
RUN mkdir /venv

# Copy the .venv directory from your host machine to the container
COPY ./.venv /venv

# Copy the script.sh and myscript.py files into the container
COPY script.sh /script.sh
COPY myscript.py /myscript.py

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron

# Grant execution rights to the shell script
RUN chmod +x /script.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
