require "hash_initializer/version"
require 'active_support/all'

module HashInitializer
  extend ActiveSupport::Concern
  included do
    def initialize(attr)
      raise(ArgumentError.new(build_err_msg(attr.class))) unless attr.class == Hash
      attr.each { |k, v| send(:"#{k}=", v) if respond_to?(:"#{k}=") }
    end
  end

  private

  # @param klass [String]
  # @return String
  def build_err_msg(klass)
    "#{klass} is not allow, argument should be Hash."
  end
end
