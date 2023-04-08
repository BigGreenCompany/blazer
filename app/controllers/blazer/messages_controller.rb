module Blazer
  class MessagesController < BaseController
    before_action :set_schema

    def index
      @query = params.dig("query")

      if @query.present?
        response = Message.new(@schema).chat(@query)
        @choices = response.dig("choices")
        @error = response.dig("error")
      end

      respond_to do |format|
        format.html { render("index") }
      end
    end

    private

    def set_schema
      @schema = Blazer.data_sources[params.fetch(:data_source, 'main')].schema
    end
  end
end
