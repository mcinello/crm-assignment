require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    print 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then abort("Goodbye!")
      # Finish off the rest for 3 through 6
      # To be clear, the methods add_new_contact and modify_existing_contact
      # haven't been implemented yet
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact
    # find contact by name
    print "Type contact name you wish to change: "
    contact_name = gets.chomp
    contact = Contact.find_by(contact_name)

    # shows the menu
    puts "What attribute would you like to modify for this contact?"
    puts '[1] First name'
    puts '[2] Last name'
    puts '[3] Email'
    puts '[4] Note'
    puts '[0] Exit'
    print "Enter attribute number: "
    attribute_number = gets.to_i

    # make sure user didn't press exit
    if attribute_number != 0
      print "What would you like to change it to? "
      user_input = gets.chomp
      contact.update(attribute_number, user_input)
    end
  end

  def delete_contact
    print "Type id of person you'd like to remove"
    id = gets.to_i

    contact = Contact.find(id)
    contact.delete
  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    print "Type in the first name, last name, or email of contact: "
    contact_attribute = gets.chomp
    Contact.find_by(contact_attribute)
  end

end

a_crm_app = CRM.new
a_crm_app.main_menu

a_crm_app.print_main_menu


at_exit do
  ActiveRecord::Base.connection.close
end
