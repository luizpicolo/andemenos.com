Rails.env.on(:any) do
  config.active_record.observers = :sweeper
end
