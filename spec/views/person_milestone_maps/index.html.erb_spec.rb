require 'rails_helper'

RSpec.describe "person_milestone_maps/index", type: :view do
  before(:each) do
    assign(:person_milestone_maps, [
      PersonMilestoneMap.create!(
        person_id: 2,
        milestone_id: 3
      ),
      PersonMilestoneMap.create!(
        person_id: 2,
        milestone_id: 3
      )
    ])
  end

  it "renders a list of person_milestone_maps" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
