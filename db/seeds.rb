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

