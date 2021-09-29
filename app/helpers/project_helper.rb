# frozen_string_literal: true

module ProjectHelper
  def available_ideas_for(project)
    ideas = Idea.without_projects.order(:name)
    project.idea.nil? ? ideas : [project.idea, *ideas]
  end
end
