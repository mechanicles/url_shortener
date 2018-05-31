require "rails_helper"

# Stubbing 'create_short_url' private method
class ShortUrl < ApplicationRecord
  private

    def create_short_url
      '123455'
    end
end

RSpec.describe "URL Shortener", type: :system do

  it "shortens a given URL" do
    visit root_path
    fill_in "short_url_original_url", with: "http://mechanicles.com"
    click_on "Shorten URL"
    expect(page).to have_no_content("123455")
  end

  it "returns error if original url is empty" do
    visit root_path
    fill_in "short_url_original_url", with: "http://mechanicles.com"
    click_on "Shorten URL"
    expect(page).to have_no_content("can't be blank")
  end

  it "returns error if original url is invalid" do
    visit root_path
    fill_in "short_url_original_url", with: "http://mechanicles.com"
    click_on "Shorten URL"
    expect(page).to have_no_content("is not valid")
  end

end
