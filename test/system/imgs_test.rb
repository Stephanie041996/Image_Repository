require "application_system_test_case"

class ImgsTest < ApplicationSystemTestCase
  setup do
    @img = imgs(:one)
  end

  test "visiting the index" do
    visit imgs_url
    assert_selector "h1", text: "Imgs"
  end

  test "creating a Img" do
    visit imgs_url
    click_on "New Img"

    fill_in "Caption", with: @img.caption
    click_on "Create Img"

    assert_text "Img was successfully created"
    click_on "Back"
  end

  test "updating a Img" do
    visit imgs_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @img.caption
    click_on "Update Img"

    assert_text "Img was successfully updated"
    click_on "Back"
  end

  test "destroying a Img" do
    visit imgs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Img was successfully destroyed"
  end
end
