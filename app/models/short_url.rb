class ShortUrl < ApplicationRecord

  BASIC_URL_REGEX = /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix

  validates :original_url, presence: true

  validates :original_url,
    format: { with: BASIC_URL_REGEX, message: "is not valid" },
    if: Proc.new { |m| m.original_url.present? }

  before_save :create_short_url

  private

    def create_short_url
      # Almost same thing we can achieve by using 'has_secure_token' Rails' built
      # in method.

      loop do
        self.short_url = SecureRandom.hex(3)
        break short_url unless ShortUrl.where(short_url: short_url).exists?
      end
    end

end
