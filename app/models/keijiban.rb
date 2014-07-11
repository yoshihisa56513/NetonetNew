class Keijiban < ActiveRecord::Base
  has_many :responses
  has_many :users
  default_scope -> { order('updated_at DESC') }
end
