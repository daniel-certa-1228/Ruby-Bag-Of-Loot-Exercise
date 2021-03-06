require "minitest/autorun"
require_relative 'lootbag'

class LootTest < MiniTest::Test

	def setup
		puts "Setup Initialized"
	end

	def test_initalize
		bag = Bag.new
		assert_instance_of Bag, bag
	end

	def test_add_toy_for_good_child
		bag = Bag.new
		bag.add_to_bag('Barry', 'slinky')
		file = File.open('deliveries.yaml', 'r+')
		delivery_list = YAML::load(file)
		current_toys = delivery_list.fetch('Barry')
		assert_includes current_toys, 'slinky'
		bag.remove_from_bag('Barry', 'slinky')
		file.close
		assert_output("A slinky was added to Barry's bag.\n") { puts "A slinky was added to Barry's bag." }
	end

	def test_add_toy_for_bad_child
		bag = Bag.new
		bag.add_to_bag('Jude', 'slinky')
		assert_output("This child is awful and will get nothing.\n") { puts "This child is awful and will get nothing." }
	end

	def test_add_toy_that_child_already_has
		bag = Bag.new
		bag.add_to_bag('Barry', 'kite')
				assert_output("Barry is spoiled and already has one of these.\n") { puts "Barry is spoiled and already has one of these." }
	end

	def test_remove_from_bag
		bag = Bag.new
		bag.remove_from_bag('Barry', 'kite')
		file = File.open('deliveries.yaml', 'r+')
		delivery_list = YAML::load(file)
		current_toys = delivery_list.fetch('Barry')
		refute_includes current_toys, 'kite'
		bag.add_to_bag('Barry', 'kite')
		file.close
		assert_output("A kite was removed from Barry's bag.\n") { puts "A kite was removed from Barry's bag." }
	end

	def test_remove_ball_from_bag
		bag = Bag.new
		bag.remove_from_bag('Barry', 'ball')
		assert_output("Balls cannot be removed from the sack.\n") { puts "Balls cannot be removed from the sack." }
	end

	def test_remove_toy_that_isnt_there
		bag = Bag.new
		bag.remove_from_bag('Barry', 'knife')
		assert_output("That item is not in the bag.\n") { puts "That item is not in the bag." }
	end

	def test_list_toy_stock
		bag = Bag.new
		bag.list_toy_stock
		assert_output("slinky\npuzzle\ngame\nkite\nball\n"){ print "slinky\npuzzle\ngame\nkite\nball\n" }
	end

	def test_list_good_kids
		bag = Bag.new
		bag.list_good_children
		assert_output("Dave\nBarry\nSilvio\nJenny\nAdrian\nMattias\n"){ print "Dave\nBarry\nSilvio\nJenny\nAdrian\nMattias\n" }
	end

	def test_list_childs_toys
		bag = Bag.new
		bag.list_toys_per_child('Barry')
		assert_output("ball\nkite\n"){ print "ball\nkite\n" }
	end

	def test_delivered
		bag = Bag.new
		bag.toys_delivered('Barry')
		assert_output("Delivered!\n") { puts "Delivered!" }
	end

	def test_set_delivered
		bag = Bag.new
		bag.set_toys_delivered('Dave')
		file = File.open('children.yaml', 'r+')
		delivered_list = YAML::load(file)
		status = delivered_list.fetch('Dave')[1].fetch(:delivered)

		assert_equal true, status

		delivered_list.fetch('Dave')[1][:delivered] = false

		file.rewind
		file.truncate(0)
		file.puts YAML::dump(delivered_list)
		file.close
	end

	def teardown
		puts "Tearing Down"
	end
end