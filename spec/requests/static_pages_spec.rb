require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample app'" do
      visit '/static_pages/home'
      page.should have_content('Sample app')
    end

    it "should have title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => 'SampleApp | Home')
    end
  end

  describe "Help page" do
    it "should say 'Pomocy'" do
      visit("/static_pages/help")
      page.should have_content('Pomocy')
    end

    it "should have title 'Help'" do
      visit "/static_pages/help"
      page.should have_selector('title', :text => '| Help')
    end
  end

  describe "About page" do
    it "shouild have page 'About'" do
      visit('/static_pages/about')
      page.should have_content('About')
    end
  end
end
