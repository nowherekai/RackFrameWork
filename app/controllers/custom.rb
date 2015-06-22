class Custom < BaseController
  def index
    Response.new.tap do |res|
      res.status_code = 200
      res.body = "hello, myframework"
    end
  end

  def show
    Response.new.tap do |res|
      res.status_code = 200
      res.body = "hello world"
    end
  end
end
