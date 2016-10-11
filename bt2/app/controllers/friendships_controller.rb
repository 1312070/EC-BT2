class FriendshipsController < ApplicationController
	def create
  	current_user = User.find(session[:user_id])
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    #@friendship = Friendship.new(f_params)
   
    if @friendship.save
      @users = User.all
      redirect_to users_path,  notice: 'Friendship was successfully created.'  
    else
      redirect_to users_path, notice: 'Unable to add friend.' 
    end
  end
  end
  def destroy
  	@friendship = Friendship.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      flash[:notice] = 'Friendship was successfully destroyed.' 
      redirect_to users_path
    end
end
