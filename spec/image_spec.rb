require 'spec_helper'

describe Image do
  context "Given an image" do
    before do
      @image = Image.new(5,4)
    end

    describe "#to_s" do
      it "returns the image as a string" do
        expect(@image.to_s).to eq("00000\n00000\n00000\n00000")
      end
    end

    describe "#paint" do
      it "colours individual pixels" do
        @image.paint(1, 1, "C")
        @image.paint(3, 3, "B")
        expect(@image.to_s).to eq("C0000\n00000\n00B00\n00000")
      end
    end

    describe "#clear" do
      it "colours individual pixels" do
        @image.paint(1, 1, "C")
        expect(@image.to_s).to eq("C0000\n00000\n00000\n00000")
        @image.clear
        expect(@image.to_s).to eq("00000\n00000\n00000\n00000")
      end
    end

    describe "#vertical_segment" do
      it "colours a vertical segment" do
        @image.vertical_segment(2, 2, 4, "W")
        expect(@image.to_s).to eq("00000\n0W000\n0W000\n0W000")
      end
    end

    describe "#horizontal_segment" do
      it "colours a horizontal segment" do
        @image.horizontal_segment(2, 4, 2, "W")
        expect(@image.to_s).to eq("00000\n0WWW0\n00000\n00000")
      end
    end


  end
end
