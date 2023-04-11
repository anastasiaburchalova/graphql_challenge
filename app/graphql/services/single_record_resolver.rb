# frozen_string_literal: true

module Services
  class SingleRecordResolver
    attr_reader :entity_klass, :params

    def initialize(entity_klass:, params:)
      @entity_klass = entity_klass
      @params = params
    end

    def call
      return if params.to_kwargs.blank?
      return if entity_klass.blank?
      return unless entity_klass.respond_to?(:where)

      entity_klass.where(params.to_kwargs).first
    end
  end
end
