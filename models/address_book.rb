require_relative 'entry'


class AddressBook
attr_accessor :entries

  def initialize
        @entries = []
  end

  p "i am here"

  def add_entry(name, phone_number, email)
    index = 0
    p "adding an entry #{name}"
    @entries.each do |entry|
      if name < entry.name
          p "i am breaking"
          break

      end
      index +=1
    end
    p "Going to add to entires #{name}"
    @entries.insert(index, Entry.new(name, phone_number, email))
  end



end
