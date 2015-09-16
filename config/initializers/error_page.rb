Rails.env.on(:any) do
  config.exceptions_app = self.routes
end
