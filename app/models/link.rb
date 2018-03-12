class Link < ApplicationRecord
  belongs_to :user

  after_create :generate_short_url
  def generate_short_url
    self.short_url = SecureRandom.hex(10).to_s+self.id.to_s
    self.save
  end

  def display_short_url
    ENV['BASE_URL'] + self.short_url
  end
end
