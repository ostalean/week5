# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

#puts "There are n companies"

#puts "There are #{Company.all.count} companies"


#to run this file we use: rails runner file

# 2. insert new rows in companies table

new_company = Company.new
#p new_company

new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://apple.com"

new_company.save #this is what insert the new values into the table
#p new_company

#puts "There are #{Company.all.count} companies"

company = Company.new
#p company

company["name"] = "Amazon"
company["city"] = "Seattle"
company["state"] = "WA"
company.save

#puts "There are #{Company.all.count} companies"

company = Company.new

company["name"] = "Twitter"
company["city"] = "San Francisco"
company["state"] = "CA"
company.save

#puts "There are #{Company.all.count} companies"

# 3. query companies table to find all row with California company

all_companies = Company.all
#p all_companies

california_companies = Company.where({"state" => "CA"})
#p california_companies

#p "companies in california: #{california_companies.count}"

# 4. query companies table to find single row for Apple

apple = Company.find_by({"name" => "Apple"}) #find_by is the same as where but only gives us that one hash and not all the array

#p apple

# 5. read a row's column value

#p apple["name"]
#p apple["url"]

# 6. update a row's column value

amazon = Company.find_by({"name" => "Amazon"})

amazon["url"] = "https://amazon.com"
amazon.save

x = Company.find_by({"name" => "Twitter"})
x["name"]= "X (formerly Twitter)"
x.save

# 7. delete a row

x = Company.find_by({"name" => "X (formerly Twitter)"})

x.destroy

puts "There are #{Company.all.count} companies"