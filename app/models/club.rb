# frozen_string_literal: true

class Club < ApplicationRecord
  has_and_belongs_to_many :members
  has_one :book
end
