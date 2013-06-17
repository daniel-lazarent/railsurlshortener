require 'base64'
class Url < ActiveRecord::Base
  attr_accessible :url
  validates :url, :presence => true
  attr_accessible :key
  validates :key, :presence => true
  
  before_validation :set_key
  def set_key
	base64 = Base64.encode64(url)
	write_attribute(:key, base64)
  end
end