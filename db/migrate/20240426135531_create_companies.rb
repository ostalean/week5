class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      #it added automatically t.primary_key id
      t.string "name"
      t.string "city"
      t.string "state"
      t.string "url"
    

      t.timestamps
    end
  end
end
