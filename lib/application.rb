require_relative 'router'

class Application
  class << self
    def router
      @router ||= Router.new
    end

    def call(env)
      route = router.route_for(env)
      if route
        response = route.execute(env)
        response.rack_response
      else
        [404, {}, []]
      end
    end
  end
end
