# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'URL Shortener', type: :system do
  it 'shortens a given URL' do
    ShortUrl.delete_all

    visit root_path
    fill_in 'short_url_original_url', with: 'http://mechanicles.com'
    click_on 'SHORTEN URL'

    short_url = ShortUrl.last

    expect(page).to have_content('http://mechanicles.com')
    expect(page).to have_content(short_url.short_url_token)
  end

  it 'returns error if original url is empty' do
    visit root_path
    fill_in 'short_url_original_url', with: ''
    click_on 'SHORTEN URL'

    expect(page).to have_content("URL can't be blank")
  end

  it 'returns error if original url is invalid' do
    visit root_path
    fill_in 'short_url_original_url', with: 'wrong url'
    click_on 'SHORTEN URL'

    expect(page).to have_content('is invalid')
  end
end
