
FROM rocker/r-base:4.0.3

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev \
  libsodium-dev

# create the application folder
RUN mkdir -p ~/application

# copy everything from the current directory into the container
COPY "/" "application/"
WORKDIR "application/" 

# open port 8080 to traffic
EXPOSE 8080

# install plumber
RUN R -e "install.packages('plumber')"

# when the container starts, start the main R script
ENTRYPOINT ["Rscript", "execute_plumber.R"]
