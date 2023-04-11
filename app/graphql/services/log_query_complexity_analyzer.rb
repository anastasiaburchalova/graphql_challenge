class Services::LogQueryComplexityAnalyzer < GraphQL::Analysis::AST::QueryComplexity
  def result
    complexity = super
    message = "[GraphQL Query Complexity] #{complexity}"
    Rails.logger.info(message)
  end
end
