class RelationshipsController < ApplicationController
  def create
    if current_user
      @relationship = Relationship.new(
        follower_id: current_user.id,
        leader_id: params[:leader_id],
      )
      @relationship.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user
      @relationship = Relationship.find_by(leader_id: params[:id], follower_id: current_user.id)
      @relationship.destroy
    end
  end
end
