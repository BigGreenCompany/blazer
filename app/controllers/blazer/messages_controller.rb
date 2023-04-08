module Blazer
  class MessagesController < BaseController
    before_action :set_schema

    def index
      @query = params.fetch("query")

      if @query.present?
        response = Message.new(@schema).chat(@query)
        @message = response.dig("choices", 0, "message", "content")
        @choices = response.fetch("choices")
      end

      respond_to do |format|
        format.html { render("messages/index") }
      end
    end

    private

    def set_schema
      @schema = Blazer.data_sources[params[:data_source]].schema
    end
  end
end
