require_relative 'entry'


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

end
