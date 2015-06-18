require 'pry'
require 'readline'

class Editor
  attr_accessor :image

  def run
    puts "Starting Bitmap editor"
    while buffer = Readline.readline("> ", true) do
      parse(buffer)
    end
  end

  def parse(buffer)
    case buffer
    when /I (\d+) (\d+)/
      create_image($1.to_i, $2.to_i)
    when /L (\d+) (\d+) (.+)/
      paint($1.to_i, $2.to_i, $3)
    when /F (\d+) (\d+) (.+)/
      fill($1.to_i, $2.to_i, $3)
    when /V (\d+) (\d+) (\d+) (.+)/
      vertical_segment($1.to_i, $2.to_i, $3.to_i, $4)
    when /H (\d+) (\d+) (\d+) (.+)/
      horizontal_segment($1.to_i, $2.to_i, $3.to_i, $4)
    when "X"
      quit
    when "S"
      show_image
    when "C"
      clear_image
    else
      puts "Unknown command"
    end
  end

  def create_image(width, height)
    @image = Image.new(width, height)
    unless @image.valid?
      puts "Bad image size"
      @image = nil
    end
  end

  def show_image
    check_image && @image.print
  end

  def clear_image
    check_image && @image.clear
  end

  def vertical_segment
    check_image && @image.clear
  end

  def paint(x, y, c)
    check_image && @image.paint(x, y, c)
  end

  def fill(x, y, c)
    check_image && @image.fill(x, y, c)
  end

  def vertical_segment(x, y1, y2, c)
    check_image && @image.vertical_segment(x, y1, y2, c)
  end

  def horizontal_segment(x1, x2, y, c)
    check_image && @image.horizontal_segment(x1, x2, y, c)
  end

  def quit
    puts "Bye bye"
    exit
  end

  def check_image
    if @image
      true
    else
      puts "Please create an image first"
      false
    end
  end
end
