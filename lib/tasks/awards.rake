# frozen_string_literal: true

namespace :awards do
  desc "Create our awards if they don't exist"
  task create_awards: :environment do
    [
      "Most likely to trigger an alert",
      "Most likely to make it into production",
      "Least likely to make it into production",
      "Best/Slickest presentation",
      "Most outside the \"boxed lunch\"",
      "Culture Cupcake (most aligned with ez values)",
      "Meta Award - Most likely to WIN an award",
      "Most Ambitious",
    ].each do |title|
      Award.find_or_create_by!(title: title)
      puts "Ensured award '#{title}' exists"
    end
  end
end
