# frozen_string_literal: true

RSpec.describe ProjectHelper do
  describe "#available_ideas_for" do
    let(:ideas_without_projects) do
      [
        create(:idea, name: "Idea E"),
        create(:idea, name: "Idea B"),
      ]
    end

    let(:ideas_with_projects) do
      [
        create(:project, idea: create(:idea, name: "Idea D")),
        create(:project, idea: create(:idea, name: "Idea A")),
      ]
    end

    context "when the project is not persisted" do
      let(:project) { Project.new }

      context "when there are just ideas without projects" do
        before { ideas_without_projects }

        it "returns those ideas, ordered by name" do
          expect(available_ideas_for(project).map(&:name)).to match_ordered_array(
            ["Idea B", "Idea E"]
          )
        end
      end

      context "when there are ideas with and without projects" do
        before do
          ideas_without_projects
          ideas_with_projects
        end

        it "returns only the ideas without projects, ordered by name" do
          expect(available_ideas_for(project).map(&:name)).to match_ordered_array(
            ["Idea B", "Idea E"]
          )
        end
      end
    end

    context "when the project is persisted" do
      let(:project) { create(:project, idea: project_idea) }
      let(:project_idea) { create(:idea, name: "Idea C") }

      context "when there are ideas without projects" do
        before { ideas_without_projects }

        it "returns only the project's idea first, then the ideas without projects, ordered by name" do
          expect(available_ideas_for(project).map(&:name)).to match_ordered_array(
            ["Idea C", "Idea B", "Idea E"]
          )
        end
      end

      context "when there are ideas with and without projects" do
        before do
          ideas_without_projects
          ideas_with_projects
        end

        it "returns only the project's idea first, then the ideas without projects, ordered by name" do
          expect(available_ideas_for(project).map(&:name)).to match_ordered_array(
            ["Idea C", "Idea B", "Idea E"]
          )
        end
      end
    end
  end
end
