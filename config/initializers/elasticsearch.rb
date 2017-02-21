# Connect to specific Elasticsearch cluster
# in the production server we set the ELASTICSEARCH_URL environment to point to the Amazon Elasticsearch Service
ELASTICSEARCH_URL = ENV['ELASTICSEARCH_URL'] || 'http://localhost:9200'

Elasticsearch::Model.client = Elasticsearch::Client.new host: ELASTICSEARCH_URL

# Print Curl-formatted traces in development into a file
#
if Rails.env.development?
  # tracer = ActiveSupport::Logger.new('log/elasticsearch.log')
  tracer = Logger.new('log/elasticsearch.log')
  tracer.level = Logger::DEBUG
end

Elasticsearch::Model.client.transport.tracer = tracer
