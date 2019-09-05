# frozen_string_literal: true

class GroupSerializer < ActiveModel::Serializer
  attributes :name, :description
  has_many :users
end
