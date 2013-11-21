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

post '/faq/?' do 
  begin
    params.each do |key, value| 
      value = CGI::escapeHTML value
      raise "Заполните все поля" if value == ""
    end
  rescue => e
    $error = e
  end
  slim :faq
end

not_found do
  slim :not_found
end