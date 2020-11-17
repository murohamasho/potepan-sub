module NotificationsHelper
  def notification_form(notification)
    @visiter   = notification.visiter
    @micropost = notification.micropost
    @comment   = nil
    @visiter_comment = notification.comment_id
    #notification.actionがfollowかlikeかcommentで分岐
    case notification.action
      when "follow" then
        tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"following you"
      when "like" then
        tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+" liked on "+tag.a('your micropost', href:micropost_path(@micropost), style:"font-weight: bold;")
      when "comment" then
        @comment = Comment.find_by(id: @visiter_comment)&.content
        tag.a(@visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+" commented on "+tag.a('your micropost', href:micropost_path(@micropost), style:"font-weight: bold;")
    end
  end
  
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
