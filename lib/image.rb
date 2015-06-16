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
    @rows = Array.new(@height) { Array.new(@width) {0} }
  end

  def paint(x, y, c)
    return unless x.between?(0, @width)
    return unless y.between?(0, @height)
    @rows[y - 1][x - 1] = c
  end

  def to_s
    @rows.map(&:join).join("\n")
  end
end

