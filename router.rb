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
    params.each { |key, value| raise "Заполните все поля" if (params[key] = CGI::escapeHTML value) == "" }
    Mail.new(to: 'mgstrl@gmail.com', from: 'mgstrl@gmail.com', subject: params[:title], body: "Имя: #{params[:author]}\nКонтактные данные: #{params[:contact]}\n\nТема: #{params[:title]}\n\n#{params[:question]}").deliver!
    $success = "Письмо успешно отправлено"
  rescue => e
    $error = e.trace
  end
  slim :faq
end

not_found do
  slim :not_found
end