# frozen_string_literal: true

class ShortUrl < ApplicationRecord
  URL_REGEX = %r{(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?}ix

  validates :original_url, presence: true
  validates :original_url, format: { with: URL_REGEX, message: 'is invalid' },
                           if: proc { |m| m.original_url.present? }

  before_save :create_short_url_token

  def to_original_url
    original_url
  end

  private

  def create_short_url_token
    # The almost same thing we can achieve by using 'has_secure_token' Rails'
    # built in method.

    loop do
      self.short_url_token = SecureRandom.hex(3)
      break short_url_token unless ShortUrl.where(short_url_token: short_url_token).exists?
    end
  end
end
