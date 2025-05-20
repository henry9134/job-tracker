Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://jobs.gaijinpot.com',
            'chrome-extension://gbopjjjhdijnnocjfjhkdgokeihbhcep'

    resource '*',
      headers: :any,
      expose: ['Authorization'],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
