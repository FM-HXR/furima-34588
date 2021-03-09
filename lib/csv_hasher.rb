require 'csv'

module CsvHasher
  module Hasher
    def self.hasher(row_label, hash_list, count)
      hash = {}
      hash[:id] = count.to_i
      hash[:option] = row_label
      if hash[:option] != nil
        hash_list << hash
      end
    end
  end

  def self.get_hashes
    csv = "#{Rails.root}/lib/collections.csv"
    cat_list = []
    cond_list = []
    mail_list = []
    pref_list = []
    day_list = []

    i = 1
    CSV.foreach(csv) do |row|
      category, condition, mailing, prefecture, day = row
      next if category == "category"
      Hasher.hasher(category, cat_list, i)
      next if condition == "condition"
      Hasher.hasher(condition, cond_list, i)
      next if mailing == "mailing"
      Hasher.hasher(mailing, mail_list, i)
      next if prefecture == "prefecture"
      Hasher.hasher(prefecture, pref_list, i)
      next if day == "day"
      Hasher.hasher(day, day_list, i)
      
      i += 1
    end
    lists = [
      cat_list,
      cond_list,
      mail_list,
      pref_list,
      day_list
    ]
    
    return lists

  end
end