# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :users
  has_many :tasks
end
