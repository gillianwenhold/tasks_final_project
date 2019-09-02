# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :priority, :due_date, :description, :complete,
  belongs_to :group
  has_many :user_tasks
  has_many :users, through: :user_tasks
end
