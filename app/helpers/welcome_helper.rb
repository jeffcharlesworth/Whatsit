module WelcomeHelper

  def private?(wiki)
    if current_user
      wiki.private && wiki.user_id != current_user.id
    else
      false
    end
  end

  def own?(wiki)
  end
end
