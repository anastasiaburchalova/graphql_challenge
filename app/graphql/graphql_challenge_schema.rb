# frozen_string_literal: true

class GraphqlChallengeSchema < GraphQL::Schema
  MAX_COMPLEXITY = 1000
  MAX_DEPTH = 10
  MAX_ERRORS = 100

  mutation(Types::MutationType)
  query(Types::QueryType)

  # For batch-loading (see https://graphql-ruby.org/dataloader/overview.html)
  use GraphQL::Dataloader
  query_analyzer(Services::LogQueryDepthAnalyzer)
  query_analyzer(Services::LogQueryComplexityAnalyzer)

  max_complexity MAX_COMPLEXITY
  max_depth MAX_DEPTH

  # GraphQL-Ruby calls this when something goes wrong while running a query:

  # Union and Interface Resolution
  def self.resolve_type(_abstract_type, _obj, _ctx)
    # TODO: Implement this method
    # to return the correct GraphQL object type for `obj`
    raise(GraphQL::RequiredImplementationMissingError)
  end

  # Stop validating when it encounters this many errors:
  validate_max_errors(MAX_ERRORS)

  # Relay-style Object Identification:

  # Return a string UUID for `object`
  def self.id_from_object(object, _type_definition, _query_ctx)
    # For example, use Rails' GlobalID library (https://github.com/rails/globalid):
    object.to_gid_param
  end

  # Given a string UUID, find the object
  def self.object_from_id(global_id, _query_ctx)
    # For example, use Rails' GlobalID library (https://github.com/rails/globalid):
    GlobalID.find(global_id)
  end
end
