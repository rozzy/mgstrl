def link href, content, classes = '', opts = []
  active = request.env['REQUEST_PATH'] == href ? true : false
  args = ""
  opts.each {|key, value| args += " #{key.to_s}=\"#{value}\""} if opts != []
  "<a href=\"#{href}\" #{"onclick=\"return false;\" " if active}class=\"#{classes}#{' active' if active}\"#{args}>#{content}</a>"
end