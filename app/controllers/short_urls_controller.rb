class ShortUrlsController < ApplicationController

  def index
    @short_urls = ShortUrl.all
    @short_url = ShortUrl.new
  end

end
