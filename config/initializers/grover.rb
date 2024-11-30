Grover.configure do |config|
  config.options = {
    format: "A4",
    margin: {
      top: "10mm",
      bottom: "20mm",
      left: "10mm",
      right: "10mm"
    },
    display_url: "http://localhost:3000"
  }
end

# display_url: Rails.application.credentials.app_url
