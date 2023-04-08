module Blazer
  class MessagesController < BaseController
    before_action :set_schema

    def index; end

    def create
      require "openai"
      content = params.fetch("message")
      client = OpenAI::Client.new(
        access_token: ""
      )
      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [
              { role: "system", content: "You are a ruby on rails expert. I am going to ask you a question and you will translate it into a raw sql query using this schema: #{@schema}"},
              { role: "user", content: message}
            ],
            temperature: 0.7,
        })
      @message = response.dig("choices", 0, "message", "content")

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @room }
      end
    end

    private

    def set_schema
      @schema = Blazer.data_sources[params[:data_source]].schema
    end
  end
end
