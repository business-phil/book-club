# frozen_string_literal: true

class AddFounderToClub < ActiveRecord::Migration[5.2]
  def change
    add_reference :clubs, :founder, foreign_key: { to_table: :members }
  end
end
