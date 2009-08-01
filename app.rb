$LOAD_PATH << File.dirname(__FILE__)+"/vendor/rack/lib"
$LOAD_PATH << File.dirname(__FILE__)+"/vendor/sinatra/lib"
require 'sinatra'
class App < Sinatra::Default
  helpers do
    def script(*paths)
      paths.map { |path| "<script type='text/javascript' src='#{path}'></script>" }.join
    end
    
    def render_file(file)
      file_path = ::File.join(Dir.pwd,file)
      rel_path = file_path.gsub(/.*\/public/,"")
      "<li><a href='#{rel_path}'>#{file}</a></li>"
    end

    def render_folder(folder=::File.dirname(__FILE__)+"/public/audio")
      buff = "<li>#{folder.split('/').last}</li>"
      buff << "<ul>"

      Dir.chdir(folder) do
        files = Dir.glob("**")
        files.sort.each do |f|
          if(::File.directory?(f))
            buff << render_folder(f)
          else
            buff << render_file(f)
          end
        end
      end
      buff << "</ul>"
    end
  end
  get "/" do
    haml :index
  end
end
