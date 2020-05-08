# frozen_string_literal: true

class Receiver::DonationsController < ApplicationController
  def index
    @donation = Donation.new

    @donations = current_user.receiver_donations.where(status: ["chosen", "confirmed"]).where('deadline >= ?', Date.today).order("deadline")
  end

  def choose
    @donation = Donation.find(params[:id])
    @donation.status = 'chosen'
    @donation.receiver = current_user
    @donation.save
    redirect_to donations_path
  end
end
