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
end

array = [
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
]
image = Image.new(array)
image.output_image