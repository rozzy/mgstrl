get '/' do
  slim :index
end

get '/*.css' do |file|
  if File.exists? "#{settings.views}/#{settings.styles}/#{file}.sass"
    content_type 'text/css', :charset => 'utf-8'
    sass :"#{settings.styles}/#{file}"
  else redirect '/' end
end