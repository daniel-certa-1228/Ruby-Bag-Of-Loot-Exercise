require_relative 'lootbag'

action, child, toy = ARGV

bag = Bag.new

case action

when 'add'
	begin
		raise ArgumentError, "You need to type both the child's name and toy after 'add'." if (child==nil || toy==nil)

		bag.add_to_bag(child, toy)

		rescue ArgumentError => e
			puts "#{e.message}"
	end

when 'remove'
	begin
		raise ArgumentError, "You need to type both the child's name and toy after 'remove'." if (child==nil || toy==nil)

		bag.remove_from_bag(child, toy)

		rescue ArgumentError => e
			puts "#{e.message}"
	end

when 'ls_child_toys'
	begin
		raise ArgumentError, "You need to type a child's name after 'ls_child_toys'." if (child==nil)

		bag.list_toys_per_child(child)

		rescue ArgumentError => e
			puts "#{e.message}"
	end

when 'ls_toy_stock'
	bag.list_toy_stock

when 'ls_good_kids'
	bag.list_good_children

when 'check_delivered'
	begin
		raise ArgumentError, "You need to type a child's name after 'check_delivered'." if (child==nil)

		bag.toys_delivered(child)

		rescue ArgumentError => e
			puts "#{e.message}"
	end

when 'mark_delivered'
	begin
		raise ArgumentError, "You need to type a child's name after 'mark_delivered'." if (child==nil)

		bag.set_toys_delivered(child)

		rescue ArgumentError => e
			puts "#{e.message}"
	end

else
	puts "To access information:"
	puts "Type 'add' [child name] [toy name] to add a toy to the bag."
	puts "Type 'remove' [child name] [toy name] to remove a toy from the bag."
	puts "Type 'ls_child_toys' [child name] to see a child's toy list."
	puts "Type 'ls_toy_stock' to see the available toys."
	puts "Type 'ls_good_kids' to see the children that will receive toys."
	puts "Type 'check_delivered' [child name] to see if a child's toys have been delivered."
	puts "Type 'mark_delivered' [child name] to mark that a child's toys have been delivered."
end