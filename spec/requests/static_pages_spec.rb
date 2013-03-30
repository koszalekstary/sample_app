require 'spec_helper'

describe "Static pages" do

  let (:base_title) { "SampleApp" }

  describe "Home page" do

    it "should have the content 'Sample app'" do
      visit '/static_pages/home'
      page.should have_content('Sample app')
    end

    it "should have title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => '#{base_title} | Home')
    end

    it "should not have | Home" do
      visit '/static_pages/home' 
      page.should_not have_selector('title', :text => "S")
    end
  end

  describe "Help page" do
    it "should say 'Pomocy'" do
      visit("/static_pages/help")
      page.should have_content('Pomocy')
    end

    it "should have title 'Help'" do
      visit "/static_pages/help"
      page.should have_selector('title', :text => '#{base_title} | Help')
    end
  end

  describe "About page" do
    it "shouild have page 'About'" do
      visit('/static_pages/about')
      page.should have_content('About')
    end
  end

  describe "Contact page" do
    it "should have title 'Contact'" do
      visit "static_pages/contact" 
      page.should have_selector('title', :text => '#{base_title} | Contact')
    end
  end
end
