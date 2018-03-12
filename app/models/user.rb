class User < ApplicationRecord
  has_many :links
  
  validates :api_key,:email, uniqueness: true

  before_create :generate_api_key

  def generate_api_key
    begin
      self.api_key = SecureRandom.hex
    end while self.class.exists?(api_key: api_key)
  end
end
