class Company < ActiveRecord::Base
  has_many :users
  has_many :campaigns

  validates :name, presence: true
end
