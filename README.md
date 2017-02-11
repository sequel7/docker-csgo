This is a big starting image so run the following ahead of time:

docker pull sequel7/csgo

Then run something like one of the following:

docker run -it --env GAME_MODE=casual -p 27015:27015 -p 27015:27015/udp sequel7/csgo

docker run -it --env GAME_MODE=armsrace -p 27015:27015 -p 27015:27015/udp sequel7/csgo

docker run -it --env GAME_MODE=deathmatch -p 27015:27015 -p 27015:27015/udp sequel7/csgo
