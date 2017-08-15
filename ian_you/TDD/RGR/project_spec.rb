require_relative 'project'
RSpec.describe Project do

before(:each) do
  @project = Project.new("Name", "Description")
end

  it "has a getter and setter for name attribute" do
    @project.name = "Changed_name"
    expect(@project.name).to eq("Changed_name")
  end

  it "has a getter and setter for the description attribute" do
    @project.description = "Changed_Description"
    expect(@project.description).to eq("Changed_Description")
  end

  it 'has a method elevator_pitch to explain name and description' do
    @project.name = "Changed_Name"
    @project.description = "Changed_Description"
    expect(@project.elevator_pitch).to eq("Changed_Name, Changed_Description")
  end
end