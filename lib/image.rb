require 'colorize'

class Image
  COLORS = {
    'B' => :blue,
    'C' => :cyan,
    'M' => :magenta,
    'O' => :grey,
    'R' => :red,
    'W' => :white,
    'Y' => :yellow
  }

  def initialize(width, height)
    @width = width
    @height = height
    clear
  end

  def valid?
    @width.between?(1,250) && @height.between?(1,250)
  end

  def colorize(char)
    if colour = COLORS[char]
      char.to_s.colorize(colour)
    else
      char
    end
  end

  def print
    to_s.each_char do |c|
      Kernel.print(colorize(c))
    end
    puts
  end

  def clear
    @columns = Array.new(@width) { Array.new(@height) {0} }
  end

  def paint(x, y, c)
    return unless x.between?(1, @width)
    return unless y.between?(1, @height)
    @columns[x - 1][y - 1] = c
  end

  def vertical_segment(x, y1, y2, c)
    return unless x.between?(0, @width)
    (y1..y2).each{|y| @columns[x-1][y-1] = c if y.between?(1, @height)}
  end

  def horizontal_segment(x1, x2, y, c)
    return unless y.between?(1, @height)
    (x1..x2).each{|x| @columns[x-1][y-1] = c if x.between?(1, @width)}
  end

  def fill(x, y, replacement)
    target = @columns[x-1][y-1]
    fill_absolute_position(x-1, y-1, target, replacement)
  end

  # Recursively fills the neighbours with the same colour
  def fill_absolute_position(x, y, target, replacement)
    return if @columns[x][y] == replacement
    return if @columns[x][y] != target
    @columns[x][y] = replacement

    neighbours = [
      [x+1, y],   # right
      [x-1, y],   # left
      [x, y+1],   # up
      [x, y-1]    # down
    ].select do |point|
      valid_point?(point)
    end.each do |point|
      fill_absolute_position(point[0], point[1], target, replacement)
    end
  end

  def valid_point?(point)
    point[0].between?(0, @width - 1) && point[1].between?(0, @height - 1)
  end


  def to_s
    out = ""

    0.upto(@height-1).each do |y|
      0.upto(@width-1).each do |x|
        out += @columns[x][y].to_s
      end
      out += "\n"
    end

    out.strip
  end
end

