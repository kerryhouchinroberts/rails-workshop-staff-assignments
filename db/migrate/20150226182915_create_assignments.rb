class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :role
      t.belongs_to :location, index: true
      t.belongs_to :person, index: true
    end
    add_foreign_key :assignments, :locations
    add_foreign_key :assignments, :people
  end
end
