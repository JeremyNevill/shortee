require "parslet"

module Shortee

  class Shortee::LittleEndianParser < Parslet::Parser

    rule(:day) { match('[0-9]').repeat(1).as(:day) }
    rule(:month) { match('[a-zA-Z0-9]').repeat(1).as(:month) }
    rule(:year) { match('[0-9]').repeat(1).as(:year) }
    rule(:forwardslash) { match['/'] }

    rule(:date) { (day >> forwardslash >> month >> forwardslash >> year) }

    root(:date)
  end

end
