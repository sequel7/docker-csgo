#!/bin/bash

if [ -z "$GAME_MODE" ] ; then
  echo "Run something like one of the following"
  echo "docker run -it --env GAME_MODE=casual -p 27015:27015 -p 27015:27015/udp sequel7/csgo:stub"
  echo "docker run -it --env GAME_MODE=armsrace -p 27015:27015 -p 27015:27015/udp sequel7/csgo:stub"
  echo "docker run -it --env GAME_MODE=deathmatch -p 27015:27015 -p 27015:27015/udp sequel7/csgo:stub"
  exit
fi


/opt/steamcmd/steamcmd.sh \
  +login anonymous \
  +force_install_dir /opt/server/ \
  +app_update 740 validate \
  +quit

cd /opt/server/

#casual
if [ "$GAME_MODE" = "casual" ]; then
  ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2 +clientport 27035 +hostport 27035 -port 27035
fi

#arms race
if [ "$GAME_MODE" = "armsrace" ]; then
  ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace +map ar_shoots +clientport 27035 +hostport 27035 -port 27035
fi

#deathmatch
if [ "$GAME_MODE" = "deathmatch" ]; then
  ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 2 +mapgroup mg_allclassic +map de_dust +clientport 27035 +hostport 27035 -port 27035
fi
