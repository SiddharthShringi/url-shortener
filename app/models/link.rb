class Link < ApplicationRecord
  
  validates :url, presence: true, format: URI::regexp(%w[http https])
  validates :short_url, uniqueness: true
end
