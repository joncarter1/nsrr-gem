# frozen_string_literal: true

require "nsrr/helpers/color"
require "nsrr/helpers/json_request"
require 'io/console'

module Nsrr
  module Helpers
    # Helper to verify that user is authenticated.
    class Authorization
      def self.get_token(token)
        # Try to read the token from the environment.
        token = ENV['NSRR_TOKEN']
        # Check if the token is nil or empty
        if token.to_s.strip.empty?
            puts  "  Get your token here: " + "#{Nsrr::WEBSITE}/token".bg_gray.blue.underline
            puts  "  Your input is hidden while entering token.".white
            print "     Enter your token: "
            token = STDIN.noecho(&:gets).chomp if token.to_s.strip == ""
            token.strip!
        else
            puts  "  Using token from environment variable NSRR_TOKEN."
        end
        (response, _status) = Nsrr::Helpers::JsonRequest.get("#{Nsrr::WEBSITE}/api/v1/account/profile.json", auth_token: token)
        if response.is_a?(Hash) && response["authenticated"]
          puts "AUTHORIZED".green + " as " + "#{response["first_name"]} #{response["last_name"]}".white
        else
          puts "UNAUTHORIZED".red + " Public Access Only"
        end
        token
      end
    end
  end
end
