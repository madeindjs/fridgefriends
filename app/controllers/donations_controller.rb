# frozen_string_literal: true

class DonationsController < ApplicationController
  def index
    @donation = Donation.new
    @categories = params[:categories] || []
    @donations = Donation.where.not(giver: current_user)
      .where(giver: current_user.friends, status: "pending")
      .where('deadline >= ?', Date.today)
      .order("deadline")

    if @categories.present?
      @donations = @donations.where("categories && ARRAY[?]::varchar[]", @categories)
    end
  end
end
