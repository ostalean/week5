# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

#puts "There are #{Company.all.count} companies"
#puts "There are #{Contact.all.count} contacts"

# 1. insert new rows in the contacts table with relationship to a company

apple = Company.find_by({"name" => "Apple"}) #Search apple for linking after. Normally we would do it by "ID" by in this case ID changes everytime we run the code
amazon = Company.find_by({"name" => "Amazon"})

contact = Contact.new
contact["first_name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "tim@apple.com"
contact["company_id"] = apple["id"] #this is how we relate Tim to apple in the company table
contact.save

contact = Contact.new
contact["first_name"] = "Craig"
contact["last_name"] = "Fede"
contact["email"] = "Craig@apple.com"
contact["company_id"] = apple["id"] 
contact.save

contact = Contact.new
contact["first_name"] = "Jeff"
contact["last_name"] = "Bezos"
contact["email"] = "Jef@amazon.com"
contact["company_id"] = amazon["id"] 
contact.save

puts "There are #{Company.all.count} companies"
puts "There are #{Contact.all.count} contacts"


# 2. How many contacts work at Apple?
apple_contacts = Contact.where({"company_id" => apple["id"]})
#p apple_contacts

puts "Apple contacts: #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?

for employee in apple_contacts
    first_name = employee["first_name"]
    last_name= employee["last_name"]

    p "#{first_name} #{last_name}"
end