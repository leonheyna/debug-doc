# -- stage-1 -- #
# Build the war.
FROM gradle:6.9.4-jdk11 AS builder
# copy sources and and build
WORKDIR "/home/gradle/whatever"
COPY . .
RUN gradle assemble

# -- stage-2 -- #
# Create final environment
FROM eclipse-temurin:11-jre AS runner
# Copy runnable war from build
COPY --from=builder /home/gradle/whatever/build/libs/*.war /opt/app/whatever.war
# Expose http port
EXPOSE 8080
# RUN cmd
CMD ["sh", "-c", "java $JAVA_OPTS -Dgrails.env=${_GRAILS_ENV} -jar /opt/app/whatever.war"]
