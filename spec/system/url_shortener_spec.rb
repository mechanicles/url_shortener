require "rails_helper"

RSpec.describe "URL Shortener", type: :system do

  it "shortens a given URL" do
    visit root_path
    fill_in "short_url_original_url", with: "http://mechanicles.com"
    click_on "Shorten URL"
    expect(page).to have_no_content("http://mechanicles.com")
  end

end
