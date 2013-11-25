class Middleware::Krakdroid
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.host.starts_with?("krakdroid2013")
      [301, {"Location" => "http://www.krakdroid.pl"}, self]
    else
      @app.call(env)
    end
  end

  def each(&block)
  end
end
