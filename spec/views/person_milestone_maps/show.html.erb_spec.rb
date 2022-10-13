require 'rails_helper'

RSpec.describe "person_milestone_maps/show", type: :view do
  before(:each) do
    @person_milestone_map = assign(:person_milestone_map, PersonMilestoneMap.create!(
      person_id: 2,
      milestone_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
