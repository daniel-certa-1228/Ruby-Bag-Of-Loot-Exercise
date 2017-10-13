require 'yaml'

child_hash = {
	"Dave" => [
		{:good => true},
		{:delivered => false}],
	"Barry" => [
		{:good => true},
		{:delivered => true}],
	"Bart"	=> [
		{:good => false},
		{:delivered => false}],
	"Silvio" => [
		{:good => true},
		{:delivered => true}],
	"Jenny" => [
		{:good => true},
		{:delivered => true}],
	"Adrian" => [
		{:good => true},
		{:delivered => false}],
	"Jude" => [
		{:good => false},
		{:delivered => false}],
	"Mattias" => [
		{:good => true},
		{:delivered => true}]
}
# puts child_hash

gift_hash = {
	:toy_1 => "Slinky",
	:toy_2 => "Rubick's Cube",
	:toy_3 => "Lawn Darts",
	:toy_4 => "Green Slime",
	:toy_5 => "Ball"
}
# puts gift_hash

 bag_hash = {
 	"Dave" => [],
 	"Barry" => ["Rubick's Cube", "Ball"],
 	"Bart" => [],
 	"Silvio" => [],
 	"Jenny" => ["Ball", "Green Slime"],
 	"Adrian" => [],
 	"Jude" => [],
 	"Mattias" => []
}
# puts bag_hash

dump = File.open('deliveries.yaml', 'w+')
# dump.puts YAML::dump(child_hash)
# dump.puts YAML::dump(gift_hash)
dump.puts YAML::dump(bag_hash)
dump.close


