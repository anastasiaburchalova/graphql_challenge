# frozen_string_literal: true

class GraphqlChallengeSchema < GraphQL::Schema
  MAX_COMPLEXITY = 1000
  MAX_DEPTH = 15
  MAX_ERRORS = 100

  mutation(Types::MutationType)
  query(Types::QueryType)

  # For batch-loading (see https://graphql-ruby.org/dataloader/overview.html)
  use GraphQL::Dataloader
  query_analyzer(Services::LogQueryDepthAnalyzer)
  query_analyzer(Services::LogQueryComplexityAnalyzer)

  max_complexity MAX_COMPLEXITY
  max_depth MAX_DEPTH

  # Stop validating when it encounters this many errors:
  validate_max_errors(MAX_ERRORS)
end
