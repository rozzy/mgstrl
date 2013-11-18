def link href = '#', content = '', classes = '', opts = nil, args = ''
  active = request.env['REQUEST_PATH'] == href ? true : false
  opts.each {|key, value| args += " #{key.to_s}=\"#{value}\""} if opts != nil
  "<a href=\"#{href}\" #{"onclick=\"return false;\" " if active}class=\"#{classes}#{' active' if active}\"#{args}>#{content}</a>"
end