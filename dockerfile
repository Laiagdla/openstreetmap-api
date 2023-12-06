# Use the base image
FROM wiktorn/overpass-api

# Set environment variables
ENV OVERPASS_META=yes
ENV OVERPASS_MODE=init
ENV OVERPASS_PLANET_URL=https://download.geofabrik.de/europe/germany/berlin-latest.osm.bz2
# ENV OVERPASS_PLANET_URL=https://download.geofabrik.de/europe/germany/berlin-latest.osm.pbf
# ENV OVERPASS_DIFF_URL=https://osm-internal.download.geofabrik.de/europe/monaco-updates/
ENV OVERPASS_RULES_LOAD=10
# ENV OVERPASS_COMPRESSION=gz
# ENV OVERPASS_UPDATE_SLEEP=3600
# ENV OVERPASS_PLANET_PREPROCESS='mv /db/planet.osm.bz2 /db/planet.osm.pbf && osmium cat -o /db/planet.osm.bz2 /db/planet.osm.pbf && rm /db/planet.osm.pbf'
# ENV USE_OAUTH_COOKIE_CLIENT=yes

VOLUME /db

# Copy the OAuth settings file to the container
# COPY oauth-settings.json /secrets/oauth-settings.json

# Expose the required port
EXPOSE 12347

# Start the container with the specified command
CMD ["-i", "-t", "--name", "overpass_berlin"]
