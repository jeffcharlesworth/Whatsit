class CollaboratorsController < ApplicationController
  def new
    @wiki_collaborators = []
    @@wiki = params['wiki_id']
    @collaborators = Wiki.find(@@wiki).collaborators
    @collaborators.each { |collaborator| @wiki_collaborators.push(collaborator.user) }
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new( user_id: find_user(params['collaborator']['user_id']), wiki_id: @@wiki)

    if @collaborator.save
      flash['notice'] = "Collaborator added."
      redirect_to edit_wiki_path(@@wiki)
    else
      flash['alert'] = "Unable to add collaborator, could not find user"
      redirect_to edit_wiki_path(@@wiki)
    end
  end

  def destroy
    @collaborator =  Collaborator.find(params[:id])

    if @collaborator.destroy
      flash['alert'] = "Collaborator removed"
      redirect_to edit_wiki_path(@@wiki)
    else
      flash['alert'] = "Unable to remove collaborator"
    end
  end

  def find_user(email)
    user = User.find_by(email: email)
    if user.nil?
      return
    else
      user.id
    end
  end
end
