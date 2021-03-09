require 'csv'

# csv_text = File.read("../scratch/resources/Untitled 1.csv")
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|

#   puts row.to_hash
# end

def hasher(row_label, hash_list, count)
  hash = {}
  hash[:id] = count.to_i
  hash[:option] = row_label
  if hash[:option] != nil
    hash_list << hash
  end
end

name_list = []
pref_list = []
cond_list = []

i = 1
CSV.foreach('../scratch/resources/Untitled 1.csv') do |row|
  name, prefecture, condition = row

  next if name == "name"
  hasher(name, name_list, i)

  next if prefecture == "prefecture"
  hasher(prefecture, pref_list, i)

  next if condition == "condition"
  hasher(condition, cond_list, i)

  i += 1
end


puts "Name Hashes:"
puts name_list
puts "-------------------------"
puts "Prefecture Hashes:"
puts pref_list
puts "-------------------------"
puts "Condition Hashes:"
puts cond_list

puts test