module BetterErrors # rubocop:disable Style/Documentation
    def self.registered(app)
        if app.development?
            BetterErrors.application_root = PADRINO_ROOT
            app.use BetterErrors::Middleware
        end
    end
end
