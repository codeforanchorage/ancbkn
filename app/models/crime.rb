class Crime < ActiveRecord::Base
  validates :lat, presence: true
  validates :lng, presence: true
end
