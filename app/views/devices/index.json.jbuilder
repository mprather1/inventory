json.array!(@devices) do |device|
  json.serial_number  device.serial_number
end
