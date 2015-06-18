require 'spec_helper'

describe Image do
  describe "#valid?" do
    it "acceps regulqr images" do
      expect(Image.new(99, 99)).to be_valid
    end

    it "rejects images above a certain size" do
      expect(Image.new(999, 999)).to_not be_valid
    end
  end

  context "Given an image" do
    before do
      @image = Image.new(5,4)
    end

    describe "#to_s" do
      it "returns the image as a string" do
        expect(@image.to_s).to eq("00000\n" \
                                  "00000\n" \
                                  "00000\n" \
                                  "00000")
      end
    end

    describe "#paint" do
      it "colours individual pixels" do
        @image.paint(1, 1, "C")
        @image.paint(3, 3, "B")
        expect(@image.to_s).to eq("C0000\n" \
                                  "00000\n" \
                                  "00B00\n" \
                                  "00000")
      end
    end

    describe "#clear" do
      it "colours individual pixels" do
        @image.paint(1, 1, "C")
        expect(@image.to_s).to eq("C0000\n" \
                                  "00000\n" \
                                  "00000\n" \
                                  "00000")
        @image.clear
        expect(@image.to_s).to eq("00000\n" \
                                  "00000\n" \
                                  "00000\n" \
                                  "00000")
      end
    end

    describe "#vertical_segment" do
      it "colours a vertical segment" do
        @image.vertical_segment(2, 2, 4, "W")
        expect(@image.to_s).to eq("00000\n" \
                                  "0W000\n" \
                                  "0W000\n" \
                                  "0W000")
      end
    end

    describe "#horizontal_segment" do
      it "colours a horizontal segment" do
        @image.horizontal_segment(2, 4, 2, "W")
        expect(@image.to_s).to eq("00000\n" \
                                  "0WWW0\n" \
                                  "00000\n" \
                                  "00000")
      end
    end

    describe "#fill" do
      it "fills an entire area" do
        @image.fill(2,2,"B")
        expect(@image.to_s).to eq("BBBBB\n" \
                                  "BBBBB\n" \
                                  "BBBBB\n" \
                                  "BBBBB")
      end
    end


  end
end
