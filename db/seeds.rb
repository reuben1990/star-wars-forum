# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create!(
  [
    { :username => "admin", :email => "admin@forum.com", :password => "forum_admin", :password_confirmation => "forum_admin" },
    { :username => "user", :email => "user@forum.com", :password => "forum_user", :password_confirmation => "forum_user" }
  ]
)

Category.create!(
  [
    { :title => "General Discussion", :position => 0 },
    { :title => "Programming Discussions", :position => 1 }
  ]
)

Forum.create!(
  [
    { :title => "General Discussion", :description => "Discuss any topic in this forum.", :category_id => Category.find_by_title("General Discussion").id, :position => 0 },
    { :title => "Ruby on Rails", :description => "Discuss Ruby on Rails.", :category_id => Category.find_by_title("Programming Discussions").id, :position => 0 },
    { :title => "PHP", :description => "Discuss PHP.", :category_id => Category.find_by_title("Programming Discussions").id, :position => 1 },
    { :title => "Javascript", :description => "Discuss Javascript.", :category_id => Category.find_by_title("Programming Discussions").id, :position => 2 },
    { :title => "CSS", :description => "Discuss CSS.", :category_id => Category.find_by_title("Programming Discussions").id, :position => 3 }
  ]
)

# Had to do this to appease validations...
@current_user = User.find_by_username("admin")
@current_user.topics.create!( :title => "Welcome to the Forum Monster Demo.", :forum_id => Forum.find_by_title("General Discussion").id, :body => "Forum Monster is a simple forum generator written in rails 3. The goal of Forum Monster, is to provide a simple, and easy to setup forum application without having to dictate how your site it setup.\r\n\r\nLive Demo: [url]http://forum-monster.heroku.com[/url]\r\nGithub Repo for Demo: [url]http://github.com/gitt/forum_monster_demo[/url]\r\n\r\n[b]A few things about what Forum Monster is, and is not:[/b]\r\n\r\n[li]Forum Monster does not do any sort of authentication, or authorization. However, it does rely on the current_user method.[/li]\r\n[li]Forum Monster while trying to assume as little as possible, currently assumes that the following columns are available from your user model: username, and created_at.[/li]\r\n[li]Forum Monster does no authorization. By default all actions are available to all users. Even logged out users. ( Although, users who are not logged in cannot post, or create topics. )[/li]\r\n\r\n[b]Authentication[/b]\r\nForum Monster, as stated before, does not come with any authentication built in. The reason for this is so you can add a forum to your existing application without having to change the way your application works. Forum Monster knows about your user model from the moment you run the installation command.\r\n\r\n[b]Authorization[/b]\r\nForum Monster, by default, allows all access to all users. Even those that are not currently logged in. This was by design, because of the vast number of authorization methods out there. If I tried to cover all of them it would just get out of hand. Not to mention that as soon as an API changes, Forum Monster would be broken. This also provides a large amount of flexibility. For example, if you wanted to use CanCan, you can! declarative_authorization? Yep. Aegis? Indeed! Since you have Forum Monster's controllers in your main application, you can customize them for your specific solution just like the rest of your application!\r\n\r\n[b]Avatars[/b]\r\nI did not include support for avatars into Forum Monster for the same reason that authentication, and authorization were not included. Flexibility! You can use whatever you like, associate it with your user model, and put the corresponding image tag in the topic show view.\r\n\r\n[b]Markdown[/b]\r\nForum Monster has no forced support for markdown. Again, it's for flexibility.\r\n\r\n[b]Modifying the views, style, and adding your own images[/b]\r\nForum Monster will install the forum-monster.css stylesheet into your public/stylesheets directory. The views will be installed in your application app/views directory." )