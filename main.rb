require_relative 'lootbag'

bag = Bag.new

# bag.list_toys_per_child('Barry')
# bag.list_good_children
# bag.add_to_bag('darts', 'Silvio')
# bag.list_toy_stock
bag.remove_from_bag('darts', 'Barry')

# rescue ArgumentError => e
# 			puts "You must enter a child's name to list their toys."