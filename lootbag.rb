require 'yaml'

class Bag

	def initialize

	end

	def add_to_bag(toy, child)
		begin
			file = File.open('children.yaml', 'r')
			child_list = YAML::load(file)
			good = child_list.fetch(child)[0].fetch(:good)

			if good
				file3 = File.open('deliveries.yaml', 'r+')
				delivery_list = YAML::load(file2)
	 			current_toys = delivery_list.fetch(child)
	 			# puts current_toys.to_s

	 			if current_toys.include?(toy)
	 				puts "#{child} is spoiled and already has one of these."
	 			else
	 				current_toys.push(toy)
	 				puts current_toys
	 			end

	 			file3.rewind
	 			file3.puts YAML::dump(delivery_list)
	 			file3.close
			else
				puts "This child is awful and will get nothing."
			end

		rescue KeyError => e
			puts "That child is not on our list."
			file.close

			file.close

		end
	end

	def remove_from_bag(toy, child)

	end

	def list_good_children
		file = File.open('children.yaml', 'r')
		good_list = YAML::load(file)

		good_list.each do |name, status|
			if status[0].fetch(:good)
				puts name
			end
		end
		file.close
	end

	def list_toys_per_child(child)
		begin
			file = File.open('deliveries.yaml', 'r')
			toy_list = YAML::load(file)
			toy_array = toy_list.fetch(child)
			puts toy_array
		rescue KeyError => e
			puts "That child is not on our list."
			file.close
		end
	end

end