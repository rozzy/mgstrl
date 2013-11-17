task :default => [:deploy]

task :deploy, :arg1 do |t, args|
  args.arg1 ||= "Some improvements"
  `git add -A`
  `git commit -m '#{args.arg1}'`
  `git push`
end