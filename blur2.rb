#output in terminal = 0000, 01000, 0001, 0000 
class Image
  attr_accessor :pixels

  def initialize(array)
    @pixels = array
  end

  def output_image
    @pixels.each do |pixel_row|
      puts "#{pixel_row.join}"
    end
  end

  #manhattan distance |x1 – x2| + |y1 – y2|

  def blur(distance)
    distance.times do
      ones = find_ones
      @pixels.each_with_index do |row, x|
        row.each_with_index do |val, y|
          if ones.include?([x, y])
            @pixels[x-1][y] = 1 unless x == 0
            @pixels[x+1][y] = 1 unless x == (@pixels.length - 1)
            @pixels[x][y-1] = 1 unless y == 0
            @pixels[x][y+1] = 1 unless y == (row.length - 1)
          end
        end
      end
    end
  end

  def find_ones
    ones = []
    @pixels.each_with_index do |row, x|
      row.each_with_index do |val, y|
        if val == 1
          ones << [x, y]        
        end
      end
    end
    ones
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
puts "---"
puts "blurred image"
# enter blur distance
image.blur(1)
puts "---"
image.output_image
puts "---"
# puts image.get_ones
