class FavoriteMailer < ActionMailer::Base
  default from: "paolo.bloccit2"
  def new_comment(user, post, comment)
 
	 # New Headers
	 headers["Message-ID"] = "<comments/#{comment.id}@paolo-bloccit.example>"
	 headers["In-Reply-To"] = "<post/#{post.id}@paolo-bloccit.example>"
	 headers["References"] = "<post/#{post.id}@paolo-bloccit.example>"
 
	 @user = user
	 @post = post
	 @comment = comment
 
	 mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
