require 'rails_helper'

RSpec.describe "person_milestone_maps/edit", type: :view do
  before(:each) do
    @person_milestone_map = assign(:person_milestone_map, PersonMilestoneMap.create!(
      person_id: 1,
      milestone_id: 1
    ))
  end

  it "renders the edit person_milestone_map form" do
    render

    assert_select "form[action=?][method=?]", person_milestone_map_path(@person_milestone_map), "post" do

      assert_select "input[name=?]", "person_milestone_map[person_id]"

      assert_select "input[name=?]", "person_milestone_map[milestone_id]"
    end
  end
end
