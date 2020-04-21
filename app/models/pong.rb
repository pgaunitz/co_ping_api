# frozen_string_literal: true

class Pong < ApplicationRecord
  validates_presence_of :item1
  belongs_to :user
  belongs_to :ping
  enum status: %i[pending accepted rejected]
end
