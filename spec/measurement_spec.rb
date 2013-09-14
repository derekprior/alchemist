require 'spec_helper'

module Alchemist
  describe Measurement do
    it "is comparable" do
      expect(1.m).to eq(1.meter)
    end

    it "can be converted" do
      expect(5.grams).to eq(0.005.kilograms)
    end

    it "can be converted with a formula" do
      expect(222.5.celsius.to.fahrenheit).to eq(432.5.fahrenheit)
    end

    it "can be multiplied" do
      Alchemist.library.register_operation_conversions(:distance, :distance, :*, :square_meters)
      expect(1.meter * 1.meter).to eq(1.square_meter)
    end

    it "can be divided" do
      expect(2.meters / 1.meter).to eq(2.0)
    end

    it "can be added" do
      expect(2.meters + 1.meter).to eq(3.meters)
    end

    it "can add different measurements" do
      expect(5.meters + 2.inches).to eq(5.0508.meters)
    end

    it "can be subtracted" do
      expect(3.meters - 2.meters).to eq(1.meter)
    end

    it "can subtract different measurements" do
      expect(5.meters - 2.inches).to eq(4.9492.meters)
    end

    it "can provide an integer value" do
      expect(10.meters.to_i).to eq(10)
    end

    it "can provide a float value" do
      expect(10.meters.to_f).to eq(10.0)
    end

    it "can provide a string value" do
      expect(10.meters.to_s).to eq("10.0")
    end

    it "can coerce correctly" do
      expect(1.meter.coerce(10)).to eq([1.meter, 10])
    end

    it "can round measurements" do
      expect(1.5.meters.round).to eq(2.meters)
    end

    it "can ceil measurements" do
      expect(1.4.meters.ceil).to eq(2.meters)
    end

    it "can floor measurments" do
      expect(1.6.meters.floor).to eq(1.meter)
    end

    describe '#geospatial' do

      it 'should convert angles to meters' do
        expect(1.degree.geospatial).to eq(111318.84502145034.meters)
      end

      it 'should convert distances to radians' do
        expect(1.mile.geospatial).to eq(0.00025232341920007525.radians)
      end
    end
  end
end
