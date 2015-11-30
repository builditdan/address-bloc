require_relative 'entry'
require "csv"


class AddressBook
attr_accessor :entries

  def initialize
        @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
          break

      end
      index +=1
    end

    @entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    found_index = nil
    @entries.each_with_index {| entry, index | found_index = index if (entry.name == name)}
    @entries.delete_at(found_index) if !found_index.nil?
  end

  def import_from_csv(file_name)
      csv_text = File.read(file_name)
      csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

      csv.each do |row|

        row_hash = row.to_hash
        add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
      end

  end

  def binary_search(name)
    lower = 0
    upper = entries.length - 1

    while lower <= upper
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

      if name == mid_name
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif
        lower = mid + 1
      end
    end

    return nil
  end

  # Review the difference between the binary search above with Jon, I matched to
  # the Wiki binary iterative search example - look the same just flipped 
  # the check around

  def interative_search(name)

    lower = 0
    upper = entries.length - 1

    while lower <= upper
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

      if mid_name == name
        return entries[mid]
      elsif mid_name < name
        lower = mid + 1
      else
        upper = mid - 1
      end
    end

    return nil

  end



end
