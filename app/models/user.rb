# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :group
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
  validates :username, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password

  def full_name
    first_name + " " + last_name
  end
end
