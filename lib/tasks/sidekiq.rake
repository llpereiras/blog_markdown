namespace :sidekiq do

    desc "Limpar a fila inteira do sidekiq"
    task :clear_all_jobs => :environment  do
        require 'sidekiq/api'
        Sidekiq.redis { |conn| conn.flushdb }
    end

end
