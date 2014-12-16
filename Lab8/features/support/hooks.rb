After do |scenario|
  name = scenario.name.delete(' ')
  if scenario.failed?
    save_screenshot("#{name}.png")
  end
end
