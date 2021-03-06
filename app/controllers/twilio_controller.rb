class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def sms
    response = Twilio::TwiML::Response.new do |r|
      r.Message 'Hey there.'
    end

    render_twiml response
  end
end
