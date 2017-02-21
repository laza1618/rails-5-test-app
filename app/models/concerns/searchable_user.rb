module SearchableUser
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    #Elasticsearch index name
    index_name 'myjobglasses_homework_user'

    #settings + mapping information ==> we just set the mapping for name here using standard analyzer
    settings(index: {number_of_shards: 1, number_of_replicas: 0}) do
      mapping do
        indexes :name, type: :string, analyzer: :standard
      end
    end

    # Method for Indexing and importing all the data to elasticsearch
    def self.import_to_es
      User.__elasticsearch__.create_index! force: true
      User.import
    end

    def as_indexed_json(options={})
      as_json(only: [:name])
    end

    #  Method for searching record using Elasticsearch, it will return the 50 firsts results
    def self.search(query)
      search_definition = {
        query: {
          bool: {
            must: [
              {
                match: {
                  query: query,
                  field: :name
                }
              }
            ]
          }
        },
        size: 50
      }
      self.__elasticsearch__.search(search_definition).records
    end
  end
end
