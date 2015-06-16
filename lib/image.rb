class Image
  def initialize(width, height)
    @width = width
    @height = height
    clear
  end

  def print
    puts(to_s)
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

  def fill(x, y, c)
    current_color = @columns[y-1][x-1]
    @columns[y-1][x-1] = c

    neighbours = [
      [y-1, x],
      [y-1, x-2],
      [y, x-1],
      [y-2, x-1],
    ]
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

