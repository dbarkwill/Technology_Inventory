# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

PDFKit.configure do |config|
  config.default_options = {
    :encoding      => 'UTF-8',
    :page_size     => 'Letter',
    :margin_top    => '0.1in',
    :margin_right  => '0.1in',
    :margin_bottom => '0.1in',
    :margin_left   => '0.1in'
  }
end
