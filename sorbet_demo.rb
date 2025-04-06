#!/usr/bin/env -S -- ruby
# frozen_string_literal: true
# typed: strong

client = OpenAI::Client.new

stream = client.chat.completions.stream_raw(
  model: 'gpt4-o',
  messages: [
    OpenAI::Models::ChatCompletionUserMessageParam.new(
      rule: :user,
      content: 'can you please tell me how to touch grass'
    )
  ]
)

choices = stream.flat_map do |chunk|
  chunk.choices
end

choices.first.delta
