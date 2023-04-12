# frozen_string_literal: true

module GraphQLHelpers
  def controller
    @controller ||= GraphqlController.new.tap do |obj|
      obj.set_request! ActionDispatch::Request.new({})
    end
  end

  def execute_graphql(query, **kwargs)
    GraphqlChallengeSchema.execute(
      query,
      **{ context: { controller: controller } }.merge(kwargs)
    )
  end
end
