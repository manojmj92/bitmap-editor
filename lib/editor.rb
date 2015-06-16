require 'pry'
require 'readline'

class Editor
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
    when "X"
      quit
    when "S"
      show_image
    else
      puts "Unknown command"
    end
  end

  def create_image(width, height)
    @image = Image.new(width, height)
  end

  def show_image
    if @image
      @image.print
    else
      puts "Please create an image first"
    end
  end

  def quit
    puts "Bye bye"
    exit
  end
end
