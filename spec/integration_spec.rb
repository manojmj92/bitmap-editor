require 'spec_helper'

describe 'complete workflow' do
  it 'runs a few commands' do
    @editor = Editor.new
    @editor.parse("I 5 6")
    @editor.parse("L 2 3 A")
    expect(@editor.image.to_s).to eq("00000" "\n" \
                                     "00000" "\n" \
                                     "0A000" "\n" \
                                     "00000" "\n" \
                                     "00000" "\n" \
                                     "00000")
    @editor.parse("F 3 3 J")
    @editor.parse("V 2 3 4 W")
    @editor.parse("H 3 4 2 Z")
    expect(@editor.image.to_s).to eq("JJJJJ" "\n" \
                                     "JJZZJ" "\n" \
                                     "JWJJJ" "\n" \
                                     "JWJJJ" "\n" \
                                     "JJJJJ" "\n" \
                                     "JJJJJ")
  end
end
