FROM python:3.8.12

MAINTAINER Manal Lamine <geekette86@gmail.com>




# Add the external tasks directory 
ADD locust-scripts $HOME/locust-scripts

# Install the required dependencies via pip
RUN pip install -r $HOME/locust-scripts/requirements.txt

# Expose the required Locust ports
EXPOSE 5557 5558 8089


# Set script to be executable
RUN chmod 755 /locust-scripts/entrypoint.sh

# Start Locust 
ENTRYPOINT ["./locust-scripts/entrypoint.sh"] 