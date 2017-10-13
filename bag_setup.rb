require 'yaml'

child_hash = {
	"Dan" => false,
	"Barry" => true,
	"Bart"	=> false,
	"Silvio" => true,
	"Jenny" => true,
	"Adrian" => true,
	"Jude" => false,
	"Mattias" => true
}
puts child_hash

gift_hash = {
	:toy_1 => "Slinky",
	:toy_2 => "Rubick's Cube",
	:toy_3 => "Lawn Darts",
	:toy_4 => "Green Slime",
	:toy_5 => "Ball"
}
puts gift_hash

 bag_hash = {
 	"Barry" => ["Rubick's Cube", "Ball"],
 	"Jenny" => ["Ball", "Green Slime"]
}
puts bag_hash

dump = File.open('toy_database.yaml', 'w+')
dump.puts YAML::dump(child_hash)
dump.puts YAML::dump(gift_hash)
dump.puts YAML::dump(bag_hash)
dump.close


