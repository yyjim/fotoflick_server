require 'sinatra'
require 'flickraw'
require 'open-uri'
require 'tempfile'

FlickRaw.api_key="284b61e98a52a83778c61f66d7e4a3f1"
FlickRaw.shared_secret="8d41899bad974b8e"

ACCESS_TOKEN = "72157637212673085-3980068d878cc8db" #yyjim
ACCESS_SECRET = "4c133c01232e6c3a"                  

get '/' do
  "Hello, world"
end

post '/upload' do  
  url = params[:image_url]  
  if url
    flickr.access_token = ACCESS_TOKEN
    flickr.access_secret = ACCESS_SECRET
    file = Tempfile.new('image')
    file.write open(url).read
    file.close
    flickr.upload_photo file.path
  end
end

