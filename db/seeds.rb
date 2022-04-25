# Data found here: https://github.com/abhionlyone/us-car-models-data
require "csv"

Dir.glob("#{Rails.root}/db/seed_data/*.csv") do |file|
  next if file == '.' or file == '..'

  CSV.read(file, headers: true).each do |row|
    make = Make.find_or_create_by!(name: row["make"])
    model = make.models.find_or_create_by!(name: row["model"], make: make)
    year = Year.find_or_create_by!(year: row["year"], model: model, make: make)
  end
end
