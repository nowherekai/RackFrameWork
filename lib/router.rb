require_relative 'route'

class Router
  attr_reader :routes
  def initialize
    @routes = Hash.new { |hash, key| hash[key] = [] }
  end

  def config(&block)
    instance_eval(&block)
  end

  def get(path, options = {})
    routes[:get] << [path, parse_route(options[:to])]
  end

  def route_for(env)
    path_info = env["PATH_INFO"]
    request_method = env["REQUEST_METHOD"].downcase.to_sym
    route_array = routes[request_method].find { |route|
      case path = route.first
      when String
        path == path_info
      when Regexp
        path =~ path_info
      end
    }

    Route.new(route_array) if route_array
  end

  private
  def parse_route(to_str)
    klass, method = to_str.split("#")
    {klass: klass.capitalize, method: method}
  end
end
