# frozen_string_literal: true

class Club < ApplicationRecord
  belongs_to :founder, class_name: 'Member'
  has_and_belongs_to_many :members
  has_one :book, dependent: :destroy
end
