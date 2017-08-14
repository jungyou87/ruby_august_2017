require_relative 'project'
RSpec.describe Project do
    before(:each) do
        @project1 = Project.new("Project 1", "description 1", "Factory Girl 1")
        @project2 = Project.new("Project 2", "description 2", "Factory Girl 2")
    end

    it 'has a getter and setter for the name attribute' do
        @project1.name = "Changed Name"
        expect(@project1.name).to eq("Changed Name")
    end

    it 'has a method elevator_pitch to explain name and descripton' do
        expect(@project1.elevator_pitch).to eq("Project 1, description 1")
        expect(@project2.elevator_pitch).to eq("Project 2, description 2")
    end

    it 'has a getter and setter for the owner attribute' do
        @project1.owner = "New Factory Girl"
        expect(@project1.owner).to eq("New Factory Girl") 
    end

    describe "project tasks" do

        it 'has a method add_tasks that pushes a task to tasks array' do
            1.upto(4) { |n| @project1.add_tasks("Task #{n}") }
            expect(@project1.tasks).to eq(["Task 1","Task 2","Task 3","Task 4"])
        end

        it 'has print_tasks method that prints every task in tasks attribute' do
            1.upto(4) { |n| @project1.add_tasks("Task #{n}") }
            expect{ @project1.print_tasks }.to output("Task 1\nTask 2\nTask 3\nTask 4\n").to_stdout
        end
    end


end