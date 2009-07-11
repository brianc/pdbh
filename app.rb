require 'sinatra'
class App < Sinatra::Default
  helpers do
    def script(*paths)
      paths.map { |path| "<script type='text/javascript' src='#{path}'></script>" }.join
    end
    
    def partial(name, obj)
      haml name, :layout => false
    end
  end
  get "/" do
    haml :index
  end
end
