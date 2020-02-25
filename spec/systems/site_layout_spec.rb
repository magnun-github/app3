require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do
  
  describe "home layout" do    
    it "contains root link" do
      visit root_path
      expect(page).to have_link nil, href: root_path, count: 1
    end

    it "contains signup link" do
      visit root_path
      expect(page).to have_link 'はじめる', href: signup_path
    end

    it "contains login link" do
      visit root_path
      expect(page).to have_link 'Login', href: login_path
    end

  describe "home layout" do
    it "returns title with 'Growth'" do
      visit root_path
      expect(page).to have_title 'Growth'
    end
  end

  describe "about layout" do
    it "returns title with 'About | Growth'" do
      visit about_path
      expect(page).to have_title 'About | Growth'
    end
  end
 end
end