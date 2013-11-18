get '/*.css' do |file|
  if File.exists? "#{settings.views}/#{settings.styles}/#{file}.sass"
    content_type 'text/css', :charset => 'utf-8'
    sass :"#{settings.styles}/#{file}"
  else redirect '/' end
end


get '/*/?' do |page|
  page = page == '' ? 'index' : page
  if File.exists? "#{settings.views}/#{page}.slim"
  slim page.to_sym 
  else raise not_found end
end

not_found do
  slim :not_found
end