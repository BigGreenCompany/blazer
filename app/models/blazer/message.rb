module Blazer
  class Message

    def initialize(schema)
      @schema = schema
      @client = OpenAI::Client.new(
        access_token: ENV["OPENAI_ACCESS_TOKEN"]
      )
    end

    def chat(query)
      @client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [
              {role: "system", content: "You are a postgresql expert. I am going to ask you a question and you will translate it into a raw sql query using this schema: #{@schema}"},
              {role: "user", content: query}
            ],
            temperature: 0.7,
        })
    end
  end
end
