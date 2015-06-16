require 'spec_helper'

describe Image do
  context "Given an image" do
    before do
      @image = Image.new(5,3)
    end

    describe "#to_s" do
      it "returns the image as a string" do
        expect(@image.to_s).to eq("00000\n00000\n00000")
      end
    end

    describe "#paint" do
      it "colours individual pixels" do
        @image.paint(1, 1, "C")
        @image.paint(3, 3, "B")
        expect(@image.to_s).to eq("C0000\n00000\n00B00")
      end
    end


  end
end
