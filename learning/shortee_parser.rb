require 'parslet'

class EmailParser < Parslet::Parser

  rule(:space) { match('\s').repeat(1) }
  rule(:space?) { space.maybe }
  rule(:dash?) { match['_-'].maybe }

  rule(:at) { str('@') | (dash? >> (str('at') | str('AT')) >> dash?) }
  rule(:dot) { str('.') | (dash? >> (str('dot') | str('DOT')) >> dash?) }

  rule(:word) { match('[a-z0-9]').repeat(1).as(:word) >> space? }
  rule(:separator) { dot.as(:dot) >> space? | space }
  rule(:words) { word >> (separator >> word).repeat }
  rule(:actor) { match('[a-z0-9]').repeat(1).as(:actor) >> space? }
  rule(:action) { match('[a-z]').repeat(1).as(:action) >> space? }
  rule(:amount) { match('[a-z]').repeat(1).as(:action) >> space? }


  rule(:email) {
    (words.as(:username) >> space? >> at >> space? >> words).as(:email)
  }

  rule(:short) {
    (space? >> at >> actor >> action >> words.as(:amount)).as(:short)
  }

  root(:short)
end

class EmailSanitizer < Parslet::Transform
  rule(:dot => simple(:dot), :word => simple(:word)) { ".#{word}" }
  rule(:word => simple(:word)) { word }

  rule(:username => sequence(:username)) { username.join + "@" }
  rule(:username => simple(:username)) { username.to_s + "@" }

  rule(:email => sequence(:email)) { email.join }
end

class ShortMaker < Parslet::Transform
  rule(:dot => simple(:dot), :word => simple(:word)) { ".#{word}" }
  rule(:word => simple(:word)) { word }

  rule(:username => sequence(:username)) { username.join + "@" }
  rule(:username => simple(:username)) { username.to_s + "@" }

  rule(:email => sequence(:email)) { email.join }
end


parser = EmailParser.new
sanitizer = EmailSanitizer.new
shortmaker = ShortMaker.new


unless ARGV[0]
  STDERR.puts "usage: #{$0} \"EMAIL_ADDR\""
  STDOUT.puts "since you haven't specified any EMAIL_ADDR, for testing purposes we're using a.b.c.d@gmail.com"
end

begin
  #p sanitizer.apply(parser.parse(ARGV[0] || 'fred@gmail.com'))

  puts
  p (parser.parse(ARGV[0] || '@jimbo drove 100miles'))
  puts
  p shortmaker.apply(parser.parse(ARGV[0] || '@jimbo drove 100miles'))

rescue Parslet::ParseFailed => error
  puts error
  puts parser.error_tree
end

