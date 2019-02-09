# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    create_table :clubs_members do |t|
      t.belongs_to :club, foreign_key: true
      t.belongs_to :member, foreign_key: true
    end
  end
end
