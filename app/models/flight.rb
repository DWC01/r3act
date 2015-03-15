class Flight < ActiveRecord::Base
  belongs_to :campaign
  has_many :ad_tags
end
