require 'pry'

class Contact

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note = 'N/A')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  #GETTER
  def email
      @email
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def id_number
    @id
  end

  def note
    @note
  end

  #SETTER
  def email=(email)
    @email = email
  end

  def first_name=(first_name)
    @first_name = email
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def note=(note)
    @note = note
  end



  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note='N/A')
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id_num)
    found_contact = false
    @@contacts.each do |contact|
      if contact.id_number == id_num
        puts contact.full_name
        found_contact = true
      end
    end
    if !found_contact
      puts "Contact not found."
    end
  end


  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(f_name = nil, l_name = nil)
    found_contact = false
    @@contacts.each do |contact|
      if contact.first_name == f_name || contact.last_name == l_name
        puts contact.full_name
        found_contact = true
      end
    end
    if !found_contact
      puts "Contact not found."
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end
  # Feel free to add other methods here, if you need them.
end



michelle_cinello = Contact.create('Michelle', 'Cinello', 'm.cinello@gmail.com')
random_person = Contact.create('Random', 'Person', 'random.person@gmail.com')

puts Contact.all.inspect
puts Contact.find(1)
puts Contact.find(2)
puts Contact.find(3)

puts Contact.find_by("Michelle")
puts Contact.find_by(nil, "Person")
puts Contact.find_by("Mimo")

Contact.delete_all

puts Contact.all.inspect
