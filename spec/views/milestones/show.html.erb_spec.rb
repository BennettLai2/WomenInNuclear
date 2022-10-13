require 'rails_helper'

RSpec.describe "milestones/show", type: :view do
  before(:each) do
    @milestone = assign(:milestone, Milestone.create!(
      name: "Name",
      points: 2,
      message: "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Message/)
  end
end
