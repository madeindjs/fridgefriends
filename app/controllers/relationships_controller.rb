class RelationshipsController < ApplicationController
# frozen_string_literal: true

  before_action :set_relationship, only: [:accept, :decline]

  def index
    @relationship_requests = current_user.relationship_requests

    @friends = current_user.friends
  end

  def new
    @relationship = Relationship.new
  end

  def create
    @user = current_user
    @relationship = Relationship.new(relationship_params)
    @relationship.user = current_user
    @relationship.save
    redirect_to relationships_path
  end

  def accept
    @relationship.status = "accepted"
    @relationship.save
    redirect_to relationships_path
  end

  def decline
    @relationship.status = "declined"
    @relationship.save
    redirect_to relationships_path
  end

  private

  def set_relationship
    @relationship = Relationship.find(params[:id])
  end

  def relationship_params
    params.require(:relationship).permit(:friend_id, :user_id)
  end
end
