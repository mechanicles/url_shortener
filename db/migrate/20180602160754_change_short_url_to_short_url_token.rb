# frozen_string_literal: true

class ChangeShortUrlToShortUrlToken < ActiveRecord::Migration[5.2]
  def change
    rename_column :short_urls, :short_url, :short_url_token
    add_index :short_urls, :short_url_token
  end
end
