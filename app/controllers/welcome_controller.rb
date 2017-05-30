class WelcomeController < ApplicationController
  include ControllerPolicy

  def index
    if current_user.nil?
      @wikis = Wiki.where(private: false)
    elsif current_user.role == 'admin'
      @wikis = Wiki.all
    elsif current_user.role == 'standard' || current_user.role == 'premium'
      @wikis = []
      all_wikis = Wiki.all
      all_wikis.each do |wiki|
        if !wiki.private? || is_collaborator(wiki) || (wiki.private? && is_owner?(wiki))
          @wikis << wiki
        end
      end
    end
    @wikis
  end
end
