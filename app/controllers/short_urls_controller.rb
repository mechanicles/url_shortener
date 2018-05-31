class ShortUrlsController < ApplicationController

  def index
    all_short_urls
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.new(short_url_params)
    if @short_url.save
      redirect_to root_path
    else
      all_short_urls
      render :index
    end
  end

  private

  def short_url_params
    params.require(:short_url).permit(:original_url)
  end

  def all_short_urls
    @short_urls = ShortUrl.all
  end

end
