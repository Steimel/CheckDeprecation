namespace :check_deprecation do
  desc 'Checks all files in log/ for deprecation warnings after optional date'
  task :all, [:date] => [:environment] do |t, args|
    Dir.entries('log').each do |logfile|
      print_deprecations('log/' + logfile, args[:date]) unless ['.', '..'].include?(logfile.to_s)
    end
  end

  desc 'Checks given file in log/ for deprecation warnings after optional date'
  task :for, [:file, :date] => [:environment] do |t, args|
    print_deprecations('log/' + args[:file], args[:date])
  end

  def print_deprecations(file_path, date)
    puts '--------------------------------------------------------'
    puts 'Checking ' + file_path.to_s + ' for deprecation warnings'
    puts '--------------------------------------------------------'

    #TODO: Handle date

    File.open(file_path, 'r') do |f|
      f.each_line do |line|
        puts line.to_s if line.to_s.downcase.start_with?('deprecation warning')
      end
    end
  end
end
