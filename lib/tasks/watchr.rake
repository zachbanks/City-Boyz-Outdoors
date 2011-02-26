desc "install watchr"
task 'watchr:install' do
  Dir.chdir "#{Rails.root}"
  File.open('.watchr', 'w') do |f|
    code = %q{
      def run_spec(file)
        unless File.exist?(file)
          puts "#{file} does not exist"
          return
        end

        puts "Running #{file}"
        system "bundle exec rspec #{file}"
        puts
      end

      watch("spec/.*/*_spec\.rb") do |match|
        run_spec match[0]
      end

      watch("app/(.*/.*)\.rb") do |match|
        run_spec %{spec/#{match[1]}_spec.rb}
      end
    }
   f.write code 
  end
  puts "watchr was succesfully installed and is ready to go."
end

desc "start watchr"
task :watchr do
  Dir.chdir("#{Rails.root}")
  if File.exists?('.watchr')
    sh %( bundle exec watchr .watchr )
  else
    puts ".watchr doesn't exist yet. Run rake watchr:install, then re-run this command."
  end
end