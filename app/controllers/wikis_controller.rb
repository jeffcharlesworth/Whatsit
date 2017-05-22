class WikisController < ApplicationController
  include WikisHelper

  before_action :authenticate_user!
  before_action :update?, except: [:index, :create, :new, :show]

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new({title: params['wiki']['title'], body: params['wiki']['body'], private: params['wiki']['private'] })
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki created"
      redirect_to wikis_path
    else
      flash.now[:alert] = "Error creating wiki, please try again"
    end
  end

  def index
    @wikis = Wiki.where(user_id: current_user.id)
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])

    if @wiki.save
      @wiki.update_attributes({ title: params[:wiki][:title], body: params[:wiki][:body], private: params['wiki']['private'] })
      flash.now[:notice] = "Wiki updated."
      render :show
    else
      flash.now[:alert] = "Unable to update the wiki, please try again."
      render :show
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" deleted."
      redirect_to wikis_path
    else
      flash.now[:alert] = "Unable to delete Wiki, please try again later."
      render :show
    end
  end
end
