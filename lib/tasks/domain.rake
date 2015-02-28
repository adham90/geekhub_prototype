namespace :domain do
  desc "create domains"
  task :create => :environment do
    line_num=0
    text=File.open("#{Rails.root}/domain.txt").read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      Domain.create(name: line)
    end
  end
end
