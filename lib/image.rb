class Image
  def initialize(width, height)
    @width = width
    @height = height
    clear
  end

  def valid?
    @width.between?(1,250) && @height.between?(1,250)
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
    fill_absolute_position(x-1, y-1, c)
  end

  # Recursively fills the neighbours with the same colour
  def fill_absolute_position(x, y, c, recursive_depth = 0)
    recursive_depth += 1
    current = @columns[x][y]
    @columns[x][y] = c

    neighbours = [
      [x+1, y],   # right
      [x-1, y],   # left
      [x, y+1],   # up
      [x, y-1]    # down
    ].select do |point|
      px = point[0]
      py = point[1]
      px.between?(0, @width - 1) && py.between?(0, @height - 1) && @columns[px][py] == current
    end

    neighbours.each do |point|
      px = point[0]
      py = point[1]
      fill_absolute_position(px, py, c, recursive_depth) if recursive_depth < 10
    end
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

