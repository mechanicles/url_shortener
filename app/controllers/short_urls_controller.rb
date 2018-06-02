# frozen_string_literal: true

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

  def redirect_to_original_url
    short_url = ShortUrl.find_by(short_url_token: params[:short_url_token])

    if short_url.present?
      redirect_to short_url.to_original_url
    else
      set_flash_message
      redirect_to root_path
    end
  end

  private

  def all_short_urls
    @short_urls = ShortUrl.all
  end

  def short_url_params
    params.require(:short_url).permit(:original_url)
  end

  def set_flash_message
    short_url_token = params[:short_url_token]
    return if short_url_token == 'short_urls'

    flash[:error] = "Not found original URL for '#{root_url}#{short_url_token}'"
  end
end
