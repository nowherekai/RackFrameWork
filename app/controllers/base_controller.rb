require_relative "../../lib/response"

class BaseController
  attr_reader :env
  def initialize(env)
    @env = env
  end
end
