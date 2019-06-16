Around do |_scenario, block|
  DatabaseCleaner.cleaning do
    block.call
  end
end