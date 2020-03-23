require 'memoist'

class Datum < ApplicationRecord
  extend Memoist
  belongs_to :house

  validates :csv_id, numericality: { only_integer: true }
  validates :label, numericality: { only_integer: true }
  validates :house_id, presence: true 
  validates :year, numericality: { only_integer: true, greater_than: 0 }
  validates :month, numericality: { only_integer: true, greater_than: 0, less_than: 13 }
  validates :temperature, presence: true
  validates :daylight, presence: true
  validates :energy_production, numericality: { only_integer: true }

  # def self.import(file)
  #   CSV.foreach(file, headers: true) do |row|
  #     datum = new(
    #       house:             House.find_by(csv_id: row['House']),
    #       csv_id:            row["ID"],
    #       label:             row["Label"],
    #       year:              row["Year"],
    #       month:             row["Month"],
    #       temperature:       row["Temperature"],
    #       daylight:         row["Daylight"],
    #       energy_production:  row["EnergyProduction"])
    #     datum.save!
    #   end
    # end
    
  class << self
    def import(file)
      data_list = []
      CSV.foreach(file, headers: true) do |row|
        data_list << {
          house:             House.find_by(csv_id: row['House']),
          csv_id:            row["ID"],
          label:             row["Label"],
          year:              row["Year"],
          month:             row["Month"],
          temperature:       row["Temperature"],
          daylight:         row["Daylight"],
          energy_production:  row["EnergyProduction"]}
      end
      create!(data_list)
    end

    def city_energy_production
      joins(:house).group('houses.city').sum('data.energy_production')
    end
  end

  def month_of_year 
    "#{year}/#{month}"
  end

  memoize :month_of_year

end
