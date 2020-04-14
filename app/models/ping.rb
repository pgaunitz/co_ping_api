class Ping < ApplicationRecord
  validates_presence_of :time
  belongs_to :user
end
