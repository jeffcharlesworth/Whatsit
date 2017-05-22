module WikisHelper
  def update?
    @wiki = Wiki.find(params[:id])
    if @wiki.private && @wiki.user_id != current_user.id
      flash.now[:alert] = "You must own this wiki to make changes."
      render :show
    end
  end
end
