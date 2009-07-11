require 'sinatra'
class App < Sinatra::Default
  get "/" do
    "Sup"
  end
end
