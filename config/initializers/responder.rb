Rails.env.on(:any) do
  # Use the responders controller from the responders gem
  config.app_generators.scaffold_controller :responders_controller
end
