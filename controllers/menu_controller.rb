require_relative '../models/address_book'

class MenuController
  attr_accessor :address_book


  def initialize
    @address_book = AddressBook.new
  end


  def main_menu

    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View Entry Number n"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    puts "You picked #{selection}"
    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      system "clear"
      view_entry_no
      main_menu
    when 6
      puts "Good-bye!"
      exit(0)
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

  def view_all_entries
    @address_book.entries.each_with_index do |entry, index|
      system "clear"
      puts "Entry Number: #{index + 1}"
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone = gets.chomp
    print "Enail: "
    email = gets.chomp
    @address_book.add_entry(name,phone,email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  puts

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e = edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "n"
    when "d"
    when "e"
    when "m"
        system "clear"
        main_menu
    else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end

  def view_entry_no
    system "clear"
    selection_no = get_entry_no
    if selection_no == nil then
      system "clear"
      main_menu
    elsif selection_no == 0
      view_entry_no
    end

    #decrement by 1 since array indexes start at 1
    selection_no -= 1
    puts "valid entry"
    @address_book.entries.each_with_index do |entry, index|
      if index == selection_no
        system "clear"
        press_enter_key_to_continue ("Entry number: #{selection_no+1}\n" + entry.to_s)
        main_menu
      end
    end
  end

def get_entry_no
  puts "Enter entry number or 0 to exit"
  x = gets.chomp
  entry_no = x.to_i
  if x == "0"
     nil
  elsif entry_no == 0
     press_enter_key_to_continue ("Invalid entry")
     entry_no
  elsif ((entry_no) > @address_book.entries.count) || (entry_no < 0)
     press_enter_key_to_continue ("Invalid entry - out of range")
     entry_no = 0
  else
    entry_no
  end
end

def press_enter_key_to_continue (msg)
  puts
  puts msg
  puts
  puts "Press the enter key to continue"
  key = gets.chomp
  system "clear"
end


end
