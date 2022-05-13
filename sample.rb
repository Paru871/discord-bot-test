# frozen_string_literal: true

require 'discordrb'
require 'dotenv/load'

bot = Discordrb::Bot.new token: ENV['DISCORD_BOT_TOKEN']
array = []

bot.reaction_add do |event|
  puts 'reaction added'
  hash = {}
  hash[:emoji] = event.emoji.name
  hash[:channel_id] = event.message.channel.id
  hash[:message_id] = event.message.id
  hash[:user_name] = event.user.name
  hash[:user_id] = event.user.id
  hash[:time] = Time.now
  hash[:type] = 'add'
  array << hash
  puts array
end

bot.reaction_remove do |event|
  puts 'reaction removed'
  hash = {}
  hash[:emoji] = event.emoji.name
  hash[:channel_id] = event.message.channel.id
  hash[:message_id] = event.message.id
  hash[:user_name] = event.user.name
  hash[:user_id] = event.user.id
  hash[:time] = Time.now
  hash[:type] = 'remove'
  array << hash
  puts array
end

bot.run
