# frozen_string_literal: true

class Member < ApplicationRecord
  has_and_belongs_to_many :clubs
  has_many :founded_clubs, class_name: 'Club', foreign_key: 'founder_id', dependent: :nullify
  has_secure_password
end
