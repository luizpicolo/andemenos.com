Rails.env.on(:any) do
  config.autoload_paths += %W(#{config.root}/sweeper)
end
