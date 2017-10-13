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
	bag.remove_from_bag(child, toy)

when 'ls_child_toys'
	bag.list_toys_per_child(child)

when 'ls_toy_stock'
	bag.list_toy_stock

when 'ls_good_kids'
	bag.list_good_children

end
# bag.list_toys_per_child('Barry')
# bag.list_good_children
# bag.add_to_bag('darts', 'Silvio')
# bag.list_toy_stock
# bag.remove_from_bag('darts', 'Barry')

# rescue ArgumentError => e
# 			puts "You must enter a child's name to list their toys."