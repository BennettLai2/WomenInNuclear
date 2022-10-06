require 'rails_helper'

RSpec.describe "milestones/index", type: :view do
  before(:each) do
    assign(:milestones, [
      Milestone.create!(
        name: "Name",
        points: 2,
        message: "Message"
      ),
      Milestone.create!(
        name: "Name",
        points: 2,
        message: "Message"
      )
    ])
  end

  it "renders a list of milestones" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Message".to_s, count: 2
  end
end
