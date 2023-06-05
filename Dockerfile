FROM dart:2.19.0 AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
COPY lib /app
COPY config /app
COPY bin /app

RUN dart pub get

# Copy app source code and AOT compile it.
COPY . .
# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline

# Start server.
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082
#CMD ["/app/bin/server"]
CMD /bin/bash -c "dart bin/main.dart --mode production"