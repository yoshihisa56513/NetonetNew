class Response < ActiveRecord::Base
  belongs_to :keijiban
  belongs_to :user
  default_scope -> {order('created_at ASC')}
end
