require 'rails_helper'

RSpec.describe "meetinglogs/show", type: :view do
  before(:each) do
    @meetinglog = assign(:meetinglog, Meetinglog.create!(
      user_id: 2,
      meeting_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
