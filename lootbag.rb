require 'yaml'

class Bag

	def initialize

	end

	def add_to_bag(child, toy)
		begin
			#Checks the child file to see if chilf has been good
			file = File.open('children.yaml', 'r')
			child_list = YAML::load(file)
			good = child_list.fetch(child)[0].fetch(:good)
			#checks the toy list to see if the specified toy is in stock
			file2 = File.open('toy_database.yaml', 'r')
			toy_list = YAML::load(file2)
			toy_on_list = toy_list.include?(toy)
			#child is good and toy on the list
			if good&&toy_on_list
				file3 = File.open('deliveries.yaml', 'r+')
				delivery_list = YAML::load(file3)
	 			current_toys = delivery_list.fetch(child)
	 			# if toy already exists, it won't be added
	 			if current_toys.include?(toy)
	 				puts "#{child} is spoiled and already has one of these."
	 			#if child is good and they don't yet have the toy, they'll get it	
	 			else
	 				current_toys.push(toy)
	 				# puts current_toys
	 				puts "A #{toy} was added to #{child}'s bag."
	 			end
	 			file3.rewind
	 			file3.puts YAML::dump(delivery_list)
	 			file3.close
	 		#child is good but toy not on the list
	 		elsif (good && (toy_on_list==false))
	 			puts "The toy must be from the toy list: #{toy_list}"
	 		#child is bad
			else
				puts "This child is awful and will get nothing."
			end

		rescue KeyError => e
			puts "That child is not on our list."

			file.close
			file2.close
		end
	end

	def remove_from_bag(child, toy)
		file = File.open('deliveries.yaml', 'r+')
		delivery_list = YAML::load(file)
		child_current_toys = delivery_list.fetch(child)
		toy_is_there = child_current_toys.include?(toy)
		is_ball = toy.eql?('ball')

		if toy_is_there&&(is_ball==false)
			child_current_toys.delete(toy)
			puts "A #{toy} was removed from #{child}'s bag."
		elsif toy_is_there&&(is_ball)
			puts "Balls cannot be removed from the sack."
		else
			puts "That item is not in the bag."
		end

		file.rewind
		file.truncate(0)
		file.puts YAML::dump(delivery_list)
		file.close
	end

	def list_toy_stock
			file = File.open('toy_database.yaml', 'r')
			toy_list = YAML::load(file)
			puts toy_list
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

	def toys_delivered(child)
		begin
			file = File.open('children.yaml', 'r')
			delivered_list = YAML::load(file)
			# puts delivered_list
			status = delivered_list.fetch(child)[1].fetch(:delivered)
			if status
				puts "Delivered!"
			else
				puts "Not delivered."
			end
			rescue KeyError => e
			puts "That child is not on our list."
		end
	end
end


















