# frozen_string_literal: true

require 'csv'

data = File.read(Rails.root.join('db/seed_data/germany_raw.csv'), encoding: 'BOM|UTF-8')

CSV.parse(data, headers: true).each do |row|
  loc = GermanNumberplan.new(row.to_hash)
  loc.save!
end
