require 'open-uri'
require 'csv'
namespace :export do
  desc "export requests to csv"
  task requests: :environment do

    file = "#{Rails.root}/public/requests_export.csv"
    CSV.open(file, 'w') do |csv|
      Request.all.each do |request|
        csv << request.attributes.map {|key,value| value}
      end
    end
  end
end
