require 'rails_helper'
describe Datum do
  describe '#create' do
    it "is invalid without a csv_id" do
     datum = build(:datum, csv_id: nil)
     datum.valid?
     expect(datum.errors[:csv_id]).to contain_exactly("can't be blank", "is not a number")
    end

    it "is invalid without a wrong type of input filled in csv_id" do
     datum = build(:datum, csv_id: "a")
     datum.valid?
     expect(datum.errors[:csv_id]).to contain_exactly("is not a number")
    end
    
    it "is invalid without a label" do
      datum = build(:datum, label: nil)
      datum.valid?
      expect(datum.errors[:label]).to contain_exactly("can't be blank", "is not a number")
    end

    it "is invalid without a wrong type of input filled in label" do
     datum = build(:datum, label: "a")
     datum.valid?
     expect(datum.errors[:label]).to contain_exactly("is not a number")
    end

    it "is invalid without a house" do
     datum = build(:datum, house: nil)
     datum.valid?
     expect(datum.errors[:house]).to contain_exactly("must exist")
    end
    
    it "is invalid without a year" do
     datum = build(:datum, year: nil)
     datum.valid?
     expect(datum.errors[:year]).to contain_exactly("can't be blank", "is not a number")
    end

    it "is invalid without a wrong type of input filled in year" do
     datum = build(:datum, year: "a")
     datum.valid?
     expect(datum.errors[:year]).to contain_exactly("is not a number")
    end
    
    it "is invalid if inputted year is less than 0" do
      datum = build(:datum, year: -1)
      datum.valid?
      expect(datum.errors[:year]).to contain_exactly("must be greater than 0")
    end

    it "is invalid without a month" do
      datum = build(:datum, month: nil)
      datum.valid?
      expect(datum.errors[:month]).to contain_exactly("can't be blank", "is not a number")
    end

    it "is invalid without a wrong type of input filled in month" do
      datum = build(:datum, month: "a")
      datum.valid?
      expect(datum.errors[:month]).to contain_exactly("is not a number")
    end
    
    it "is invalid if inputted month is less than 0" do
     datum = build(:datum, month: -1)
     datum.valid?
     expect(datum.errors[:month]).to contain_exactly("must be greater than 0")
    end

    it "is invalid if inputted month is greater than 13" do
     datum = build(:datum, month: 13)
     datum.valid?
     expect(datum.errors[:month]).to contain_exactly("must be less than 13")
    end

    it "is invalid without a temperature" do
     datum = build(:datum, temperature: nil)
     datum.valid?
     expect(datum.errors[:temperature]).to contain_exactly("can't be blank")
    end

    it "is invalid without a daylight" do
      datum = build(:datum, daylight: nil)
      datum.valid?
      expect(datum.errors[:daylight]).to contain_exactly("can't be blank")
     end

    it "is invalid without an energy_production" do
      datum = build(:datum, energy_production: nil)
      datum.valid?
      expect(datum.errors[:energy_production]).to contain_exactly("can't be blank", "is not a number")
     end

    it "is invalid without a wrong type of input filled in energy_production" do
      datum = build(:datum, energy_production: "a")
      datum.valid?
      expect(datum.errors[:energy_production]).to contain_exactly("is not a number")
     end
  end
end