require "parslet"

module Shortee

  class Shortee::Parser < Parslet::Parser
    def initialize(date_parser)
      @date_parser = date_parser
    end

    # Generic rules
    rule(:space) { match('\s').repeat(1) }
    rule(:space?) { space.maybe }
    rule(:dash?) { match['_-'].maybe }
    rule(:colon) { match[':'] }
    rule(:at) { str('@') | (dash? >> (str('at') | str('AT')) >> dash?) }
    rule(:dot) { str('.') | (dash? >> (str('dot') | str('DOT')) >> dash?) }
    rule(:integer) { match('[0-9]').repeat(1)>> space? }

    # Shortee rules
    rule(:actor) { match('[a-zA-Z0-9]').repeat(1).as(:actor) >> space? }
    rule(:actee) { match('[a-zA-Z0-9]').repeat(1).as(:actee) >> space? }
    rule(:action) { match('[a-zA-Z]').repeat(1).as(:action) >> space? }
    rule(:amountnum) { match('[0-9.]').repeat(1).as(:amountnum) >> space? }
    rule(:amountunits) { match('[a-zA-Z]').repeat(1).as(:amountunits) >> space? }

    # Date and time
    rule(:date) { @date_parser }
    rule(:time) { match('[0-9.]').repeat(1).as(:time) >> space? }

    rule(:short) {
      (space? >> at >> actor.as(:mainactor) >>
          action >>
          amountnum >> amountunits >>
          date >> space?).as(:short)
    }

    rule(:shortwithacteeg) {
      (space? >> at >> actor.as(:mainactor) >>
          action >>
          at >> actee.as(:actee) >>
          amountnum >> amountunits >>
          date >> space?).as(:short)
    }

    rule(:minute) {
      (space? >> at >> actor.as(:mainactor) >>
          action >>
          amountnum >> amountunits >>
          date >> space?).as(:short)
    }

    rule(:allshorts) { short | shortwithacteeg | minute }

    root(:allshorts)
  end

end