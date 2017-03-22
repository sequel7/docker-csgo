FROM sequel7/csgo:latest

# install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Downloading SteamCMD and make the Steam directory owned by the steam user
ADD start.sh /opt/steamcmd/start.sh
RUN chmod +x /opt/steamcmd/start.sh
RUN chown steam /opt/steamcmd/start.sh


# SteamCMD should not be used as root, here we set up user and variables
USER steam
WORKDIR /opt/steamcmd

# update existing files
RUN /opt/steamcmd/steamcmd.sh \
  +login anonymous \
  +force_install_dir /opt/server/ \
  +app_update 740 validate \
  +quit

# Execution vector
ENTRYPOINT /opt/steamcmd/start.sh
