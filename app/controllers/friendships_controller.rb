class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id=>params[:friend_id])

    respond_to do |format|
      if @friendship.save
        flash[:notice] = "add friend successfully!" 
        redirect_to root_path
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to(friendships_url) }
      format.xml  { head :ok }
    end
  end
end
