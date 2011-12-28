namespace :community do

  desc "clears the database"
  task :reset do
    if Rails.env == "production"
      Rake::Task['heroku pg:reset SHARED_DATABASE --confirm forum-monster'].invoke
    else
      Rake::Task['db:migrate:reset'].invoke
    end
  end

  desc "re-seed the database"
  task :seed => :reset do
    Rake::Task['db:seed'].invoke
  end
  
end