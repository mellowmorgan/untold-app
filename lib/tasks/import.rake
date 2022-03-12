require 'csv'
namespace :import do
  desc "Import requests from csv"
  task requests: :environment do
    filename = File.join Rails.root, "requests.csv"
    CSV.foreach(filename) do |row|
      content,status,user,categories,image = row
      Request.create!(content:content,status:status,user_id:user,categories:categories,image_url:image)
      puts Request.last
    end
  end
end