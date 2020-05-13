class Link < ApplicationRecord
  
  validates :url, presence: true, format: URI::regexp(%w[http https])
  validates :short_url, uniqueness: true, length: { is: 8 }, allow_nil: true

  def generate_short_url
    loop do
      short_url = SecureRandom.alphanumeric(8)
      self.short_url = short_url
      break short_url unless Link.where(short_url: short_url).exists?
    end
  end
end
