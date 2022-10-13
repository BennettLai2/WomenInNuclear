require 'rails_helper'

RSpec.describe "person_milestone_maps/new", type: :view do
  before(:each) do
    assign(:person_milestone_map, PersonMilestoneMap.new(
      person_id: 1,
      milestone_id: 1
    ))
  end

  it "renders new person_milestone_map form" do
    render

    assert_select "form[action=?][method=?]", person_milestone_maps_path, "post" do

      assert_select "input[name=?]", "person_milestone_map[person_id]"

      assert_select "input[name=?]", "person_milestone_map[milestone_id]"
    end
  end
end
