# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates_presence_of :role, :name
  enum role: %i[admin user]
  enum community_status: %i[pending accepted rejected]
  has_many :pings
  has_many :pongs
  belongs_to :community

  def has_active_pongs?
    pongs.any?(&:active)
  end
end
