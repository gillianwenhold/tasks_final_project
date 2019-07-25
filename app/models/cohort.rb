# frozen_string_literal: true

class Cohort < ApplicationRecord
  has_many :users
  has_many :tasks
end
