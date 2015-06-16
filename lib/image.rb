class Image
  def initialize(width, height)
    @rows = Array.new(height) { Array.new(width) {0} }
  end

  def print
    @rows.each{|row| puts row.join}
  end
end

