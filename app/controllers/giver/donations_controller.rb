# frozen_string_literal: true

class Giver::DonationsController < ApplicationController
  def index
    @donations = current_user.donations.where('deadline >= ?', Date.today).order("deadline")

    @donation = Donation.new
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.giver = current_user
    if @donation.save
      redirect_to donations_path
    else
      @donations = current_user.donations.where('deadline >= ?', Date.today).order("deadline")
      render :index
    end
  end

  def confirm
    @donation = Donation.find(params[:id])
    @donation.status = 'confirmed'
    @donation.save
    redirect_to giver_donations_path
  end

  private

  def donation_params
    params.require(:donation).permit(:photo, :deadline, :pick_up, :description, categories: [])
  end
end
