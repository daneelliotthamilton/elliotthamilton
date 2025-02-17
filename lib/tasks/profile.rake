namespace :profile do
  desc "update profile"
  task :update_profiles => :environment do
    count = 0
    Profile.all.each do |profile|
      profile.update(role: "Partner")
      count = count + 1
      print "."
    end 
    puts ''
    puts "#{count} records updated."
  end
end