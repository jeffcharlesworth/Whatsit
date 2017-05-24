module WikisHelper
  def update?
    @wiki = Wiki.find(params[:id])
    if @wiki.private && @wiki.user_id != current_user.id
      flash.now[:alert] = "You must own this wiki to make changes."
      render :show
    end
  end

  def own?
    @wiki = Wiki.find(params[:id])
    @wiki.user_id == current_user.id
  end

  def premium?
    current_user.role == 'premium'
  end

  def delete?
    @wiki = Wiki.find(params[:id])
    unless @wiki.user_id == current_user.id
      flash.now[:alert] = "You must own this to delete it"
      render :show
    end
  end
end
