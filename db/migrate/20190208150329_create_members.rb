class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    create_table :clubs_members do |t|
      t.belongs_to :club, index: true
      t.belongs_to :member, index:true
    end
  end
end
