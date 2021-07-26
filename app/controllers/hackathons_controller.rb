# frozen_string_literal: true

class HackathonsController < ApplicationController
  def index
    @hackathons = Hackathon.all
  end
end
