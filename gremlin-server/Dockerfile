FROM tinkerpop/gremlin-server:latest

# Add support for both websockets and http requests
RUN sed -i "s|^channelizer:.*|channelizer: org.apache.tinkerpop.gremlin.server.channel.WsAndHttpChannelizer|" ./conf/gremlin-server.yaml

# Allow for string based IDs
RUN sed -i "s|^gremlin.tinkergraph.vertexIdManager=.*|gremlin.tinkergraph.vertexIdManager=ANY|" ./conf/tinkergraph-empty.properties

# Remove ReferenceElementStrategy for use with graph-explorer - return all properties
RUN sed -i "s|^globals << \[g.*|globals << [g : traversal().withEmbedded(graph).withStrategies()]|" ./scripts/empty-sample.groovy

# Increase thread stack to 2m
ENV JAVA_OPTIONS="-Xss2m -Xms512m -Xmx4096m"