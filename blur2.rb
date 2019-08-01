#output in terminal = 0000, 01000, 0001, 0000 
class Image
  attr_accessor :pixels

  def initialize(pixels)
    @pixels = pixels
  end

  def output_image
    @pixels.each do |pixel_row|
      puts "#{pixel_row.join}"
    end
  end


  def blur(distance)
    distance.times do
      ones = find_ones
      @pixels.each_with_index do |row, i|
        row.each_with_index do |val, j|
          if ones.include?([i, j])
            @pixels[i-1][j] = 1 unless i == 0
            @pixels[i+1][j] = 1 unless i == (@pixels - 1)
            @pixels[i][j-1] = 1 unless j == 0
            @pixels[i][j+1] = 1 unless j == (@row - 1)
          end
        end
      end
    end
  end

  def find_ones
    ones = []
    @pixels.each_with_index do |row, i|
      row.each_with_index do |val, j|
        if val == 1
          ones << [i, j]        
        end
      end
    end
  end
end

array = [
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
]
image = Image.new(array)
image.output_image
puts "--"
puts "blurred image"
# enter blur distance
image.blur(3)
puts "--"
image.find_ones
image.output_image
puts "--"