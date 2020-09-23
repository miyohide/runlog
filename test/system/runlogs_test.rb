require "application_system_test_case"

class RunlogsTest < ApplicationSystemTestCase
  setup do
    @runlog = runlogs(:one)
  end

  test "visiting the index" do
    visit runlogs_url
    assert_selector "h1", text: "Runlogs"
  end

  test "creating a Runlog" do
    visit runlogs_url
    click_on "New Runlog"

    fill_in "Distance", with: @runlog.distance
    fill_in "Run date", with: @runlog.run_date
    click_on "Create Runlog"

    assert_text "Runlog was successfully created"
    click_on "Back"
  end

  test "updating a Runlog" do
    visit runlogs_url
    click_on "Edit", match: :first

    fill_in "Distance", with: @runlog.distance
    fill_in "Run date", with: @runlog.run_date
    click_on "Update Runlog"

    assert_text "Runlog was successfully updated"
    click_on "Back"
  end

  test "destroying a Runlog" do
    visit runlogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Runlog was successfully destroyed"
  end
end
