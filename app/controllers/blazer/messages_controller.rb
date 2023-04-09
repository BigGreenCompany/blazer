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
      # TODO: refactor
      # some models limit the number of tokens
      # rejecting blazer tables saves some space
      # not likely to want to create a query about queries
      @schema = Blazer.data_sources[params.fetch(:data_source, 'main')]
                      .schema
                      .reject { |table| table[:table].starts_with? 'blazer_' }
                      .map { |hash| hash.except(:schema) }
    end
  end
end
