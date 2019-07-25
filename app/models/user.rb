# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :cohort
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
  has_secure_password
end
