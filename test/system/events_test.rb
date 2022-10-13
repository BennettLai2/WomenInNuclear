require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Description", with: @event.description
    fill_in "End time", with: @event.end_time
    fill_in "Meeting", with: @event.meeting_id
    fill_in "Meeting name", with: @event.meeting_name
    fill_in "Points", with: @event.points
    fill_in "Start time", with: @event.start_time
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

<<<<<<< HEAD
    fill_in "Description", with: @event.description
    fill_in "End time", with: @event.end_time
    fill_in "Meeting", with: @event.meeting_id
    fill_in "Meeting name", with: @event.meeting_name
    fill_in "Points", with: @event.points
    fill_in "Start time", with: @event.start_time
=======
    fill_in "End", with: @event.end
    fill_in "Points", with: @event.points
    fill_in "Start", with: @event.start
    fill_in "Url", with: @event.url
>>>>>>> origin/dev/kiran-test
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
