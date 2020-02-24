require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do

  describe "home layout" do
    it "returns title with 'Lantern Lantern'" do
      visit root_path
      expect(page).to have_title 'Lantern Lantern'
    end
  end

  describe "about layout" do
    it "returns title with 'About | Lantern Lantern'" do
      visit about_path
      expect(page).to have_title 'About | Lantern Lantern'
    end
  end
end