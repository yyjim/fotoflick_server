require 'sinatra'
require 'flickraw'
require 'open-uri'
require 'tempfile'

FlickRaw.api_key="284b61e98a52a83778c61f66d7e4a3f1"
FlickRaw.shared_secret="8d41899bad974b8e"

ACCESS_TOKEN = "72157637230661926-6115cf7788a86f63" #fotoflick_tester@yahoo.com.tw pw4
ACCESS_SECRET = "bc6fc4fda7cd78b8"                  

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

