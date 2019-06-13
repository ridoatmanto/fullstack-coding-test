def minimum_unique(input)
  ####
  # PLEASE WRITE YOUR CODE HERE
  # YOU ARE FREE TO CREATE ANY OTHER SUPPORTING FUCTION AS NECESSARY
  ###

  temp_sum = 0

  input.each_with_index do |item, index|
  	input[index] += 1 while input.count(input[index]) > 1
  	temp_sum += input[index]
  end

  temp_sum
end

output_filename = ENV['OUTPUT_PATH'] || 'output.txt'
output_file = File.open(output_filename, 'w')

count = gets.strip.to_i

input = Array.new(count)

count.times do |i|
  item = gets.strip.to_i
  input[i] = item
end

result = minimum_unique input

output_file.write result
output_file.write "\n"
output_file.close
	