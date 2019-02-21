# frozen_string_literal: true

class Member < ApplicationRecord
  has_and_belongs_to_many :clubs
  has_secure_password
end
