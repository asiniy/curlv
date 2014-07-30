namespace :db do
  task reload: [:drop, :create, :migrate, :seed] do
    desc 'Drop,create,migrate,seed'
    Rake::Task['db:test:prepare'].invoke unless Rails.env.production?
  end
end
